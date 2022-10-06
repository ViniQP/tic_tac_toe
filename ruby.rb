class Game
  attr_accessor :board, :available_positions
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winner = nil
    player1.game_board = self
    player2.game_board = self
  end

  def show_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def check_winner(player)
    player_type = player.player_type
      all_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    all_combinations.any? do |combination|
      combination.all? { |position| @board[position - 1] == player_type } 

    end 
  end

  def play_round
    count = 1
    
    loop do
      puts
      self.show_board
      print "Player 1 Move: "
      @player1.play(gets.chomp.to_i)
      if self.check_winner(@player1) == true
        puts "Player 1 Wins!"
        break
      end
      
      if count == 9
        puts
        puts "TIE!"
        break
      else 
        count += 1
      end
  
      puts
      self.show_board
      print "Player 2 Move: "
      @player2.play(gets.chomp.to_i)
      if self.check_winner(@player2) == true
        puts "Player 2 Wins!"
        break
      end
  
      if count == 9
        puts "TIE!"
        break
      else 
        count += 1
      end
    end
    puts
    self.show_board
  end
end

class Player
  @@players = []
  attr_accessor :player_type, :game_board, :plays
  
  def initialize(player_type)
    @player_type = player_type
    @plays = []
    @@players << self
    @game_board
  end

  def play(play)
    board = game_board.board
    available = game_board.available_positions
    
    if available.include?(play)
      @plays.push(play)
      board[play - 1] = @player_type
      available.delete(play)
    else
      print "invalid move, try again: "
      self.play(gets.chomp.to_i)
    end 
  end 
end

