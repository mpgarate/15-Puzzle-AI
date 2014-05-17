require './puzzle_solver/board.rb'
require './puzzle_solver/ai.rb'

class PuzzleSolver
  def self.solve(matrix)
    @board = Board.new(matrix)
    @ai = AI.new

    puts @board
  end
end
