class Player
  
  attr_reader :board
  
  def initialize(num_spaces)
    #instantiate board
    @board = Board.new(num_spaces)
  end
  
  def is_defeated?
  	defeated = true
  	@board.ships.each do |ship|
      if !ship.is_sunk?
        defeated = false
      end    
    end
  	defeated
  end
 
  
end
