require 'set'

class AI
  def initialize(b)
    @board = b
  end

  def solve

    if @board.is_solved?
      puts "solved!"
      return
    end
    board_set = Set.new
    board_set << @board

    queue = []
    queue << @board

    while(queue.length > 0)
      current_board = queue.pop

      valid_swaps = current_board.get_valid_swaps

      valid_swaps.each do |valid_swap|
        new_board = Board.new(current_board.matrix)
        new_board.swap!(valid_swap[0],valid_swap[1])

        puts new_board.matrix.to_s

        unless board_set.include? new_board
          if new_board.is_solved?
            puts "Solved!"
            return
          else
            board_set << new_board
            queue << new_board
          end
        end
      end
    end
  end
end