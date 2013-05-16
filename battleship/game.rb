class Game
  
  attr_reader :human
  
  def initialize(num_spaces)  
    
    #instantiate players
    @human = Player.new(num_spaces)
    @comp = Player.new(num_spaces)
    @num_spaces = num_spaces.to_i
    @game_over = false
  end
  
  #display commands 
  def display_commands
     
  end

  def prompt_for_command
      
      while !@game_over
        puts  "s = show boards, q = quit, ? = help"
      
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
          puts "you selected " + x
          if !validate_coord_range(x) 
            puts "Invalid column, please try again. " + "\n" + "\n"
          else
            #first coord is valid, get column input
            puts "Enter row number:"
            y = gets.chomp
            if y =='s' 
              puts "show boardzzzzzz \n"
              show_boards
            elsif y =='q'
              puts 'quit the game'
              exit
            elsif y == '?'
              puts 'help text here'
            else
              puts "you selected " + y
              if !validate_coord_range(y) 
                puts "Invalid row, please try again. " + "\n" + "\n"
              else
                puts "That coordinate is valid!!!!! carry on" + "\n\n\n\n"
                #shoot if not
                if !@comp.board.spaces[x.to_i - 1][y.to_i - 1].is_shot?
                  puts 'not shot yet'
                  @comp.board.spaces[x.to_i - 1][y.to_i - 1].shoot
                  puts 'you shot space ' + x + ',' + y + '!!!!!' + "\n"              
                  #check if hit
                  @comp.board.ships.each do |ship|
                    ship.spots.each do |spot|
                      #if ship occupies space, mark shot  
                      if spot['x'] == x.to_i-1 && spot['y'] == y.to_i-1
                        puts 'hit!'
                        
                      end
                       
                    end    
                  end  
                  #if hit, check if sunk ship
                  #if sunk ship, check if game over, set to over
              
                #else notify and prompt again
                else
                  puts x + ',' + y +' has already been shot, enter a different coordinate.'
                end
              
            
              end
            end
          end
        end
      end
      #repeat command prompt
      prompt_for_command
  end

  #show human board and what they know of comp board
  def show_boards
    @human.board.display
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