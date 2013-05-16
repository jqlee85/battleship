class Ship
  
  attr_accessor :spots
  attr_reader :type
  attr_reader :type_fail
  attr_reader :coords
  attr_reader :ship_length
  
  def initialize(type)
    
    #set type
    @type = type
   
    
    #create blank Hash to hold coordinates and hit status
    case type
    when 'patrol boat'
        @spots = Array.new(2)
        @ship_length = 2
    when 'cruiser'
        @spots = Array.new(3)
        @ship_length = 3
    when 'submarine'
        @spots = Array.new(3)
        @ship_length = 3
    when 'battleship'
        @spots = Array.new(4)
        @ship_length = 4
    when 'aircraft carrier'
        @spots = Array.new(5)
        @ship_length = 5
    else 
        @type_fail = true
        puts 'invalid ship type'
        @spots = Array.new
    end
  end #end initialize method
     
#takes in coordinates and places ship
  
  def place(coords)  
    #turns array of coordinates into hash with coords as keys and nil as hit values
    @spots = Hash[coords.collect { |coord| [coords, nil] }]
  end
  
  #takes in array of coordinates and sets spots hash to reference corresponding spaces
  def set_spots(coord_array)
   
  end
  
  
  
  
  
  
  
#returns true if sunk, false if alive
  def is_sunk?  
    sunk = true
    @spots.each do |spot|
      if !spot.is_shot?
        sunk = false
      end   
    end
    return sunk
  end

   

end