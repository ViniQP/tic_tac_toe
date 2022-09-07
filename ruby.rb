class Player
  @@players = []
  
  def initialize(player)
      @player = player
      @slots = []
      @@players << self
  end

  def play(move, board)
    @slots << move.to_sym
    board.edit_board(move)
  end
end

class Board
  attr_writer :board
  
  def initialize
    @board = { 
      one: 1,
      two: 2,
      three: 3,
      four: 4,
      five: 5,
      six: 6,
      seven: 7,
      eight: 8,
      nine: 9,
    }
  end
  
  def show_board
    puts "#{@board[:one]}|#{@board[:two]}|#{@board[:three]}"
    puts "#{@board[:four]}|#{@board[:five]}|#{@board[:six]}"
    puts "#{@board[:seven]}|#{@board[:eight]}|#{@board[:nine]}"
  end

  def edit_board(move)
    @board[move.to_sym] = "x"
  end
end


board = Board.new
player1 = Player.new("player1")
board.show_board
puts
player1.play("one", board)
board.show_board
puts
player1.play("two", board)
board.show_board
puts
player1.play("three", board)
board.show_board