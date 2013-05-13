class Board 
  
  attr_reader :spaces
  attr_reader :num_spaces
  
  def initialize(num_spaces)
    
    #set num of rows and columns
    @num_spaces = num_spaces
    rows = *(0..num_spaces-1)
    columns = *(0..num_spaces-1)
    
    #create array for spaces and instantiate space objects
    @spaces = Array.new
    
    columns.each do |column_num|
      @spaces[column_num] = Array.new
      rows.each do |row_num|
        @spaces[column_num][row_num] = Space.new    
      end
    end
     
    #instantiate ships
    @ships = Hash.new
    @ships['patrol boat'] = Ship.new('patrol boat')
    @ships['cruiser'] = Ship.new('cruiser')
    @ships['submarine'] = Ship.new('submarine')
    @ships['battleship'] = Ship.new('battleship')
    @ships['aircraft carrier'] = Ship.new('aircraft carrier')
    
    
    #iterate over ships trying to place ships randomly
    @ships.each do |name, ship|
      #length = ship.spots.length
       
      puts 'ship.type works' + ship.type
      
      placed = false
      #
      #not done
      #
      #generate random position to try 
      while !placed
      
        origin = random_coords()
        test_coord = origin.dup
        orientation = random_orientation()
        
        
        
        #
        #not done
        #
        #validate if placement fits on board
        #validate if doesn't overlap ship
        #call place method on ship passing in coordinate array if validated
        placed = true
      end
    
    end
    
  end

  def random_coords()
    random_coords = Hash.new
    random_coords['x'] = rand(1..@num_spaces)
    random_coords['y'] = rand(1..@num_spaces)
    random_coords
  end

  def random_orientation()
    num = rand(1..4)
    
    case num
    when 1
      return 'up'
    when 2
      return 'right'
    when 3
      return 'down'
    else 
      return 'left'
    end
      
  end
    
  def is_available?(coord)
    #checks if coord is available
    if @spaces[coord['x']][coord['y']].is_empty
      return true
    else
      return false
    end
  end

  def has_up(space)
    #return space that exists above a given space, nil if none
    if space['x'] > 1
      space['x'] -= 1
      space
    else
      nil
    end
  end
  
  def has_right(space)
    #return space that exists to right of a given space, nil if none
    if space['y'] < @num_spaces
     space['y'] += 1
     space
    else
      nil
    end
  end
  
  def has_down(space)
    #return space that exists below a given space, nil if none
    if space['x'] < @num_spaces
      space['x'] += 1
      space
    else
      nil
    end
  end
  
  def has_left(space)
    #return space that exists to left of a given space, nil if none
    if space['y'] > 1
      space['y'] -= 1
      space
    else
      nil
    end  
  end

  def display
    #displays board
    puts 'this is a board'
  end
  
end