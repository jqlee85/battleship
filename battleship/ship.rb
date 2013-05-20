class Ship
  
  attr_reader :spots
  attr_reader :type
  attr_reader :type_fail
  attr_reader :coords
  attr_reader :ship_length

#initialize method  
  def initialize(type)   
    #set type
    @type = type   
    @spots = Array.new
    
    
    #set length variables
    case type
    when 'patrol boat'
        @ship_length = 2
    when 'cruiser'
        @ship_length = 3
    when 'submarine'
        @ship_length = 3        
    when 'battleship'
        @ship_length = 4
    when 'aircraft carrier'
        @ship_length = 5
    else 
        @type_fail = true
        puts 'invalid ship type'
    end
    
    @life = @ship_length
  end #end initialize method
     
#takes in coordinates and places ship 
  def place(coord_array)  
    #sets spots array to the coordinates occupied by the ship
    @spots = coord_array.dup    
  end 
 
  
#returns true if sunk, false if alive
  def is_sunk?  
    if @life > 0
      return false
    else
      return true
    end
  end

  def hit_ship
    @life -=1
  end
   

end