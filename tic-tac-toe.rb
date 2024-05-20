class TicTacToe
  require_relative 'board'

    def initialize
      @board = Board.new
      @current_player = 'X'
    end
  
    def play
      loop do
        @board.display
        player_move
        if @board.winner?
          @board.display
          puts "Player #{@current_player} wins!"
          break
        elsif @board.full?
          @board.display
          puts "It's a draw!"
          break
        end
        switch_player
      end
    end
  
    private
  
    def player_move
      move = nil
      loop do
        print "Player #{@current_player}, where do you want your marker? "
        move = gets.chomp.to_i
        break if @board.update(move, @current_player)
        puts "Invalid move. Please try again."
      end
    end

  
    def switch_player
      @current_player = @current_player == 'X' ? 'O' : 'X'
    end
  end

  game = TicTacToe.new
game.play
