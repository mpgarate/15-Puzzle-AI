require 'set'

class AI
  def initialize(b)
    @board = b
  end

  def solve
    iterations = 0

    visited = Hash.new(false)
    queue = MinHeap.new
    queue.push(@board, @board.score)

    while(not queue.empty?)
      iterations += 1

      #if iterations > 100000
        #puts "could not find solution"
        #return
      #end

      puts "its: #{iterations}" if iterations % 10000 == 0

      current_board = queue.pop_min

      if current_board.is_solved?
        puts "Solved!"
        return current_board
      end

      #puts "queue length: #{queue.length}"

      #puts "branching from previous #{current_board.last_swap}"

      valid_swaps = current_board.get_valid_swaps #.shuffle

      valid_swaps.each do |valid_swap|
        new_board = Board.new(current_board.matrix, current_board.swap_history)

        #puts new_board.to_s

        #puts "swapping #{valid_swap}"

        new_board.swap!(valid_swap)

        #puts new_board.to_s

        key = new_board.matrix
        if visited[key] == false
          visited[key] = true
          queue.push(new_board,new_board.score)
        end
      end
    end
  end
end