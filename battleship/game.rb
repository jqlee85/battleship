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
      puts "Enter coordinates to fire: ex: a1 \n"
      puts  "s = show boards, q = quit, ? = help"
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
        end
      end
      prompt_for_command
  end

  #show human board and what they know of comp board
  def show_boards
    @human.board.display
    @comp.board.display
  end

  #parse coordinates and return array of numbers if valid, return false if not
  def parse_coordinates(coord)
    #split coordinates into array
    split_string = coord.split("")
    coord_array = Hash.new
    
    #if length is 2 split into coordinate array, else return false
    if split_string.length == 2
      coord_array["column"]=split_string[0]
      coord_array["row"]=split_string[1];    
    else
      return false 
    end
    
    #check if column is alpha and downcase else return false
    if coord_array["column"].letter? 
      coord_array["column"] = coord_array["column"].downcase
    else
      return false
    end
    
    #if row is not numeric, return false
    if coord_array["row"].numeric? == false
      return false
    end
    
    #check if column and row are within bounds of board
    if coord_array["row"] < 0 || coord_array["row"] > @num_spaces
      return false
    end
    
    
      
  end

end