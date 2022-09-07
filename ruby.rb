class Player
  attr_reader :slots
  @@players = []
  
  def initialize(player)
      @playervalue = "x"
      @player = player
      @slots = []
      @@players << self
  end

  def play(move, board)
    @slots << move
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

  def check_win(slots)
    return true if slots.all? { |slot| ["one", "two", "three"].include? slot } 
    return true if slots.all? { |slot| ["four", "five", "six"].include? slot }
    return true if slots.all? { |slot| ["seven", "eight", "nine"].include? slot }
    
    return true if slots.all? { |slot| ["one", "four", "seven"].include? slot }
    return true if slots.all? { |slot| ["two", "five", "eight"].include? slot }
    return true if slots.all? { |slot| ["three", "six", "nine"].include? slot }

    return true if slots.all? { |slot| ["one", "five", "nine"].include? slot }
    return true if slots.all? { |slot| ["three", "five", "seven"].include? slot }
    return false
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
player1.play("four", board)
board.show_board

puts board.check_win(player1.slots) 

["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]