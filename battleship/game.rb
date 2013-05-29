class Game
  
  attr_reader :human
  
  def initialize(num_spaces)  
    
    #instantiate players
    @human = Player.new(num_spaces)
    @comp = Player.new(num_spaces)
    @num_spaces = num_spaces.to_i
    @game_over = false

    display_commands
    
    play_game
  
  end
  
  #display commands 
  def display_commands
     puts "\n\n" + "WELCOME TO BATTLESHIP" + "\n"
     puts "Commands:"
     puts "s = Show boards"
     puts "c = Cheat"
     puts "q = Quit game"
     puts "? = help"
     puts "\n"
  end
  
  def play_game
    while !@game_over
      prompt_for_command
      computer_turn
    end 
  end
  
  #get input from user
  def get_input(row_or_column)
    
    selected = false
    while !selected
      puts "Enter #{row_or_column} number:"
      x = gets.chomp
      if x =='s' 
        show_boards(false)
      elsif x =='c'
        show_boards(true)
      elsif x =='q'
        puts 'quit the game'
        exit
      elsif x == '?'
        puts 'help text here'
      else
        puts "you selected " + x
        if !validate_coord_range(x) 
          puts "Invalid #{row_or_column}, please try again. " + "\n" + "\n"
        else
          selected = true
        end
      end
    end
    x
  end

  def game_over?
    if @human.is_defeated? || @comp.is_defeated?
      true
    else
      false
    end   
  end


  def prompt_for_command
      
    shot_made = false
    
    #get column
    x = get_input("column")
    #get row
    y = get_input("row")
    
    
        
      
            
    #shoot if not
    if !@comp.board.spaces[x.to_i][y.to_i].is_shot?
      @comp.board.spaces[x.to_i][y.to_i].shoot
      puts 'you shot space ' + x + ',' + y + '!!!!!' + "\n"              
      shot_made = true
      
      #check if hit
      @comp.board.ships.each do |ship|
        ship.spots.each do |spot|
          #if ship occupies space, mark shot  
          #spot is coord_array
          if spot['x'] == x.to_i && spot['y'] == y.to_i
            puts 'hit!'
            ship.hit_ship
            if ship.is_sunk?
              puts 'you sunk the ' + ship.type
            end
          end
           
        end    
      end  
      
  
    #else notify and prompt again
    else
      puts x + ',' + y +' has already been shot, enter a different coordinate.'
    end
      
    #if game over exit  
    if game_over?
      puts 'YOU WON!!!'
      @comp.board.display(true)
      exit
    end
    
    puts "\n"
    return shot_made
  end

  def computer_turn
    #generate random coord
    coords = @human.board.random_coords
    
    x = coords['x'].to_s
    y = coords['y'].to_s
     
    #retry if space already shot, shoot if not
    if @human.board.spaces[coords['x']][coords['y']].is_shot?
      computer_turn
    else
      @human.board.spaces[coords['x']][coords['y']].shoot
      puts 'comp shot space ' + x + ',' + y + "\n" 
    end
 
    #check if hit
    @human.board.ships.each do |ship|
      ship.spots.each do |spot|
        #if ship occupies space, mark shot  
        #spot is coord_array
        if spot[x] == coords['x'] && spot[y] == coords['y']
          puts 'hit!'
          ship.hit_ship
          if ship.is_sunk?
            puts 'Computer sunk your ' + ship.type
          end
        end
         
      end    
    end
    
    #if game over exit  
    if game_over?
      puts "THE COMPUTER WON. On random... Up your game next time."
      @human.board.display(true)
      exit
    end
  
    puts "\n"
  end



  #show human board and what they know of comp board
  def show_boards(cheat)
    puts '      human board'
    @human.board.display(true)
    puts ''
    puts '      comp board'
    @comp.board.display(cheat)
    
  end

  


  #returns true if valid row or column # given, else returns false
  def validate_coord_range(num)
    number = num.to_i
    if (numeric?(number) && number <= @num_spaces && number > 0)
      return true
    else
      return false
    end 
  end


end