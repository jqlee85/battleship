class Space
  
  
  def initialize
    #map num to coordinates
    @empty = true
    @shot = false
    @ship_id = nil
  
    
  end
  
  #return true if empty, false if occupied
  def is_empty
    @empty
  end
  
  #mark space as occupied
  def occupy
    @empty = false
    
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