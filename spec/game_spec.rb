require './ruby.rb'

describe Game do
  it "checks if the player has won vertically" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.board = [1, "X", 3, 4, "X", 6, 7, "X", 9]
    expect(game.check_winner(player1)).to eql(true)
  end

  it "checks if the player has won horizontally" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.board = [1, 2, 3, 4, 5, 6, 'O', 'O', 'O']
    expect(game.check_winner(player2)).to eql(true)
  end

  it "checks if the player has won diagonally" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.board = ['X', 2, 3, 4, 'X', 6, 7, 8, "X"]
    expect(game.check_winner(player1)).to eql(true)
  end
end