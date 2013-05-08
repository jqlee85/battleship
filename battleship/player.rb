class Player
  
  attr_reader :board
  
  def initialize(num_spaces)
    #instantiate board
    @board = Board.new(num_spaces)
  end
  
  
  
end
