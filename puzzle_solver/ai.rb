require 'set'

class AI
  def initialize(b)
    @board = b
  end

  def solve
    iterations = 0

    queue = []
    queue << @board

    while(queue.length > 0)
      iterations += 1

      if iterations > 100000
        puts "could not find solution"
        return
      end

      current_board = queue.shift

      if current_board.is_solved?
        puts "Solved!"
        return
      end

      puts "queue length: #{queue.length}"

      puts "branching from previous #{current_board.last_swap}"

      valid_swaps = current_board.get_valid_swaps.shuffle

      valid_swaps.each do |valid_swap|
        new_board = Board.new(current_board.matrix)

        puts new_board.to_s

        puts "swapping #{valid_swap}"

        new_board.swap!(valid_swap)

        puts new_board.to_s

        queue << new_board
      end
    end
  end
end