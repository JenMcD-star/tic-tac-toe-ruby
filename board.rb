class Board
    def initialize
      @board = Array.new(3) { Array.new(3, ' ') }   
    end
  
    def display
        puts display_row(0)
        puts "---|---|---"
        puts display_row(1)
        puts "---|---|---"
        puts display_row(2)
      end
      
      def display_row(row)
        result = ""
        (0..2).each do |col|
          if @board[row][col] == "X" || @board[row][col] == "O"
            result += " #{@board[row][col]} "
          else
            result += " #{row * 3 + col + 1} "
          end
          result += "|" unless col == 2
        end
        result
      end
      
  
      def update(move, marker)
        row, col = case move
                   when 1
                     [0, 0]
                   when 2
                     [0, 1]
                   when 3
                     [0, 2]
                   when 4
                     [1, 0]
                   when 5
                     [1, 1]
                   when 6
                     [1, 2]
                   when 7
                     [2, 0]
                   when 8
                     [2, 1]
                   when 9
                     [2, 2]
                   else
                     puts "Invalid move"
                     return false
                   end
      
          @board[row][col] = marker
          true
      end
      
      
      
  
    def full?
      @board.flatten.none? { |cell| cell == ' ' }
    end
  
    def winner?
      winning_combinations.any? do |combination|
        [@board[combination[0][0]][combination[0][1]],
         @board[combination[1][0]][combination[1][1]],
         @board[combination[2][0]][combination[2][1]]].uniq.size == 1 &&
         @board[combination[0][0]][combination[0][1]] != ' '
      end
    end
  
    private
  
    def winning_combinations
      [
        [[0, 0], [0, 1], [0, 2]],
        [[1, 0], [1, 1], [1, 2]],
        [[2, 0], [2, 1], [2, 2]],
        [[0, 0], [1, 0], [2, 0]],
        [[0, 1], [1, 1], [2, 1]],
        [[0, 2], [1, 2], [2, 2]],
        [[0, 0], [1, 1], [2, 2]],
        [[0, 2], [1, 1], [2, 0]]
      ]
    end
  end