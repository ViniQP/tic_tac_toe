class Board

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
end


board1 = Board.new
board1.show_board