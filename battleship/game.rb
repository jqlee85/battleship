class Game
  
  attr_reader :human
  
  def initialize(num_spaces)  
    
    #instantiate players
    @human = Player.new(num_spaces)
    @comp = Player.new(num_spaces)
    @num_spaces = num_spaces
  end
  
  #display commands 
  def display_commands
     
  end

  def prompt_for_command
      
      puts  "s = show boards, q = quit, ? = help"
      
      puts "Enter row number:"
      
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
        if !parse_coordinates(x) 
          puts "Invalid coordinates, please try again. " + "\n" + "\n"
        else
          puts "That's a valid coordinate!"
        end
      end
      prompt_for_command
  end

  #show human board and what they know of comp board
  def show_boards
    @human.board.display
    @comp.board.display
  end

  
  


  #returns true if valid row or column # given, else returns false
  def validate_coord_input(num)
    if numeric?(num) && num <= @num_spaces && num > 0
      return true
    else
      return false
    end 
  end




end