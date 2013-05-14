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
    
      puts "ship length is " + ship.ship_length.to_s
      #create hash to hold coordinates  
      coord_array = Array.new
      #set placed to false
      placed = false
     
      #while not placed, try to place 
      while !placed
        #generate random position
        origin = random_coords()
        test_coord = origin.dup
        #generate random orientation
        orientation = random_orientation()
        can_place = true
        
        #test each coord and add to hash if it is available
        ship.ship_length.times do
          if !is_available?(test_coord)
            can_place = false
            puts 'did not work'
            break
          
          else
            coord_array.push(test_coord.dup)
            test_coord = get_next(test_coord, orientation)
          end
          
          
          
        end
        
        if can_place
          #save coord_array
          #mark spaces as occupied
          
          #set placed to true to break from loop and move on to next ship
          placed = true
          puts 'placed ship ' + ship.type 
          puts 'array is ' + coord_array.length.to_s
          
        end
        #loop restarts to try to place again
      end  
      #loop restarts for next ship, if last one, loop ends here
    end
    
    #all ships have been placed, board initialized
    
  end

  def random_coords()
    random_coords = Hash.new
    random_coords['x'] = rand(1..@num_spaces)
    random_coords['y'] = rand(1..@num_spaces)
    return random_coords
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
    if (coord['x'] < 1 || coord['x'] > @num_spaces || coord['y'] < 1 || coord['y'] > @num_spaces)
      return false
    end
    puts 'x=' + coord['x'].to_s + '/y=' + coord['y'].to_s
    #checks if coord is available
    if @spaces[coord['x']][coord['y']].is_empty
      return true
    else
      return false
    end
  end

  #returns next space if exists, false if not 
  def get_next(space, orientation)    
    case orientation
    when 'up'
      if has_up(space) != false
        has_up(space)
      else 
        return false
      end
    when 'down'
      if has_down(space) != false
        has_down(space)
      else 
        return false
      end
    when 'left'
      if has_left(space) != false
         has_left(space)
      else
        return false
      end
    when 'right'
      if has_right(space) != false
        has_right(space)
      else
        return false
      end
    else
      false
    end
  end
  
  
  
  def has_up(space)
    #return space that exists above a given space, nil if none
    if space['y'] > 1
      space['y'] -= 1
      space
    else
      return false
    end
  end
  
  def has_right(space)
    #return space that exists to right of a given space, nil if none
    if space['x'] < @num_spaces
     space['x'] += 1
     space
    else
      return false
    end
  end
  
  def has_down(space)
    #return space that exists below a given space, nil if none
    if space['y'] < @num_spaces
      space['y'] += 1
      space
    else
      return false
    end
  end
  
  def has_left(space)
    #return space that exists to left of a given space, nil if none
    if space['x'] > 1
      space['x'] -= 1
      space
    else
      return false
    end  
  end

  def display
    #displays board
    puts 'this is a board'
  end
  
end