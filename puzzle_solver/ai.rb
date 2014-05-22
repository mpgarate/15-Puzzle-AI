require 'set'

class AI
  def initialize(b)
    @board = b
  end

  def solve
    iterations = 0

    visited = Set.new
    queue = MinHeap.new
    queue.push(@board, @board.score)

    while(not queue.empty?)
      iterations += 1

      puts "its: #{iterations}" if iterations % 10000 == 0

      current_board = queue.pop_min

      if current_board.is_solved?
        puts "Solved!"
        return current_board
      end

      valid_swaps = current_board.get_valid_swaps #.shuffle

      valid_swaps.each do |valid_swap|
        new_board = Board.new(current_board.matrix, current_board.swap_history)

        new_board.swap!(valid_swap)

        key = new_board.matrix
        if not visited.include? key
          visited.add(key)
          queue.push(new_board,new_board.score)
        end
      end
    end
  end
end