require './puzzle_solver/board.rb'
require './puzzle_solver/ai.rb'
require './puzzle_solver/min_heap.rb'

class PuzzleSolver
  def self.solve(matrix)
    @board = Board.new(matrix)
    @ai = AI.new(@board)

    @ai.solve
  end
end
