require './puzzle_solver.rb'

=begin

puzzle = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,nil]
]

puzzle = [
            [5,  1,  3,  2],
            [9,  6,  14,  4],
            [10, 7, 11, 8],
            [13, nil, 15, 12]            
          ]



puzzle = PuzzleSolver.solve(puzzle)

puzzle.print_swap_history

puts puzzle.to_s
=begin
puzzle = [
      [1,6,2,4],
      [9,11,5,7],
      [13,nil,3,12],
      [14,10,8,15]
]
=end

=begin
puzzle = [
          [2, 13, 9, 8],
          [nil, 14, 7, 3],
          [1, 10, 11, 15],
          [12, 4, 6, 5]
          ]
=end


puzzle = [
          [4,8,1,nil],
          [10,7,11,3],
          [14,2,13,15],
          [9,6,12,5]
          ]

puzzle = PuzzleSolver.solve(puzzle)

puzzle.print_swap_history

# board = Board.new(puzzle)
# puts board.score