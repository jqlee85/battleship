class Game
  
  attr_reader :human
  
  def initialize(num_spaces)  
    
    #instantiate players
    @human = Player.new(num_spaces)
    @comp = Player.new(num_spaces)
    @num_spaces = num_spaces.to_i
    @game_over = false

    display_commands
    
    turn
  
  end
  
  #display commands 
  def display_commands
     puts "\n\n" + "WELCOME TO BATTLESHIP" + "\n"
     puts "Commands:"
     puts "s = Show boards"
     puts "q = Quit game"
     puts "? = help"
     puts "\n"
  end
  
  def turn
    while !@game_over
      if prompt_for_command
        computer_turn
      end
        
    end
    
    
    
  end
  
  #get input from user
  def get_column_input
    #get column input
    column_selected = false
    while !column_selected
      puts "Enter column number:"
      x = gets.chomp
      if x =='s' 
        puts "show boardzzzzzz \n"
        show_boards
      elsif x =='q'
        puts 'quit the game'
        exit
      elsif x == '?'
        puts 'help text here'
      else
        puts "you selected " + x
        if !validate_coord_range(x) 
          puts "Invalid column, please try again. " + "\n" + "\n"
        end
      end
    end
  end
  
  
  def prompt_for_command
      
    shot_made = false
  
    #get row input
    puts "Enter column number:"
    x = gets.chomp
    if x =='s' 
      puts "show boardzzzzzz \n"
      show_boards
    elsif x =='q'
      puts 'quit the game'
      exit
    elsif x == '?'
      puts 'help text here'
    else
      
      if !validate_coord_range(x) 
        puts "Invalid column, please try again. " + "\n" + "\n"
        
      else
        #first coord is valid, get column input
        puts "Enter row number:"
        y = gets.chomp
        if y =='s' 
          puts "show boardzzzzzz \n"
          show_boards
          prompt_for_command
        elsif y =='q'
          puts 'quit the game'
          exit
        elsif y == '?'
          puts 'help text here'
          prompt_for_command
        else
          
          if !validate_coord_range(y) 
            puts "Invalid row, please try again. " + "\n" + "\n"
            
          else
            
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
              
              #if sunk ship, check if game over, set to over
          
            #else notify and prompt again
            else
              puts x + ',' + y +' has already been shot, enter a different coordinate.'
            end
            
        
          end
        end
      end
      
    end
      #check if game over
      @game_over = true
      @comp.board.ships.each do |ship|
        if !ship.is_sunk?
          @game_over = false
        end    
      end
      
      #if game over exit  
      if @game_over
        puts 'YOU WON!!!'
        @comp.board.display
        exit
      #else repeat command prompt  
      
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
    
    #check if game over
    @game_over = true
    @comp.board.ships.each do |ship|
      if !ship.is_sunk?
        @game_over = false
      end    
    end
    
    #if game over exit  
    if @game_over
      puts "THE COMPUTER WON. On random... Up your game next time."
      @human.board.display
      exit
    end
  
    puts "\n"
  end



  #show human board and what they know of comp board
  def show_boards
    puts '      human board'
    @human.board.display
    puts ''
    puts '      comp board'
    @comp.board.display
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

  #shoot coordinate
  



end