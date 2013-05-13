class Space
  
  attr_reader :hey
  
  def initialize
    #map num to coordinates
    @empty = true
    @shot = false
    @ship_id = nil
  
    @hey = 'heyooooo'
  end
  
  #return true if empty, false if occupied
  def is_empty
    @empty
  end
  
  #mark space as occupied
  def occupy(ship_id) 
    @empty = false
    #note which ship is occupying space
    @ship_id = ship_id
  end
  
  #return true if shot, false if not
  def is_shot? 
    @shot
  end
  
  #mark space as shot
  def shoot
    @shot = true
  end
  
  
end