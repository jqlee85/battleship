class Board 
  
  attr_reader :spaces
  attr_reader :num_spaces
  attr_reader :ships
  
  def initialize(num_spaces)
    @did_not_work = 0
    
    #set num of rows and columns
    @num_spaces = num_spaces
    rows = *(1..@num_spaces)
    columns = *(1..@num_spaces)
    
    #create array for spaces and instantiate space objects
    @spaces = Hash.new
    columns.each do |column_num|
      @spaces[column_num] = Hash.new
      rows.each do |row_num|
        @spaces[column_num][row_num] = Space.new    
      end
    end
     
    #instantiate ships array
    @ships = Array.new
    @ships.push(Ship.new('patrol boat'))
    @ships.push(Ship.new('cruiser'))
    @ships.push(Ship.new('submarine'))
    @ships.push(Ship.new('battleship'))
    @ships.push(Ship.new('aircraft carrier'))
  
    #place ships on board
    place_ships
  
  end
  
    
  def place_ships
    #iterate over ships hash trying to place ships randomly
    @ships.each do |ship|
      
      #set placed to false
      placed = false
     
      #while not placed, try to place 
      while !placed
        #create Array to hold coordinates  
        coord_array = Array.new
        
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
            break         
          else
            coord_array.push(test_coord.dup)
            test_coord = get_next(test_coord, orientation)
          end                
        end
        
        if can_place
          placed = true
          #set placed to true to break from loop and move on to next ship
        end
      
      #loop restarts to try to place again
      end  
      
      # TO DO 
      # TO DO 
      # TO DO 
      #mark spaces as occupied
      
      #place ship
      ship.place(coord_array)
      #puts 'placed ' + ship.type + ' at '
      #mark spaces as occupied
      ship.spots.each do |spot|
        @spaces[spot['x']][spot['y']].occupy
        #puts spot['x'].to_s + spot['y'].to_s
      end
       
      
      
    #loop restarts for next ship
    end
    
    #puts 'all ships placed'
    #all ships have been placed
  end

  def random_coords
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
    if coord == nil
      return false
    end
    if (coord['x'] < 1 || coord['x'] > @num_spaces || coord['y'] < 1 || coord['y'] > @num_spaces)
      return false
    end
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
      return get_up(space)
    when 'down'
      return get_down(space)
    when 'left'
      return get_left(space)
    when 'right'
      return get_right(space)
    else
      nil
    end
  end
  
  
  
  def get_up(space)
    #return space that exists above a given space, nil if none
    if space['y'] > 0
      space['y'] -= 1
      space
    else
      return nil
    end
  end
  
  def get_right(space)
    #return space that exists to right of a given space, nil if none
    if space['x'] < @num_spaces-1
     space['x'] += 1
     space
    else
      return nil
    end
  end
  
  def get_down(space)
    #return space that exists below a given space, nil if none
    if space['y'] < @num_spaces-1
      space['y'] += 1
      space
    else
      return nil
    end
  end
  
  def get_left(space)
    #return space that exists to left of a given space, nil if none
    if space['x'] > 0
      space['x'] -= 1
      space
    else
      return nil
    end  
  end

  def display(cheat)
    #displays board
    
    #first line
    print '   '
    @spaces.each do |column_num,row_num|
      
      if column_num.to_s.length < 2
        print ' ' 
      end
      print column_num.to_s + ' '
      
    end
    
    #subsequent lines
    
    i=1
    puts ''
    @spaces[i].each do |row_key, space|
      print row_key
      if row_key.to_s.length == 1
        print '  '
      else
        print ' '
      end
      
      j=1
      @num_spaces.times do  
        if !@spaces[j][i].is_empty
           print_space(j,i,cheat)
        else
          if@spaces[j][i].is_shot?
            print ' O '
          else
            print '   '
          end
        end
        j+=1
      end  
      
      puts ''
      i+=1
    end
    puts ''
  
  end
  
  def print_space(x,y,cheat)
    coord = Hash.new
    coord['x'] = x
    coord['y'] = y
    if cheat || @spaces[x][y].is_shot?
      print '['
    else
      print ' '
    end
    if @spaces[x][y].is_shot?
      print 'X'
    else
      print ' '
    end
    if cheat || @spaces[x][y].is_shot?
      print ']'
    else
      print ' '
    end
  end
  
end