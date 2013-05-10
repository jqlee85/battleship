class Board 
  
  attr_reader :spaces
  
  def initialize(num_spaces)
    
    #set num of rows and columns
    rows = *(1..num_spaces)
    columns = *(1..num_spaces)
    
    #create array for spaces and instantiate space objects
    @spaces = Array.new
    
    columns.each do |column_num|
      @spaces[column_num] = Array.new
      rows.each do |row_num|
        @spaces[column_num][row_num] = Space.new    
      end
    end
     
    #instantiate ships
    #iterate over ships trying to place ships randomly
      #validate if placement fits on board
      #validate if doesn't overlap ship
      #call place method on ship passing in coordinate array if validated
    
    
  end

    
  def exists(space)
    #return true if space exists
  end

  def has_up(space)
    #return true if a space exists above a given space 
  end
  
  def has_right(space)
    #return true if a space exists to right of a given space
  end
  
  def has_down(space)
    #return true if a space exists below a given space
  end
  
  def has_left(space)
    #return true if a space exists to left of a given space
  end

  def display
    #displays board
    puts 'this is a board'
  end
  
end