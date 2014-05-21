require './puzzle_solver.rb'

=begin
puzzle = [
            [5,  1,  3,  2],
            [9,  6,  14,  4],
            [10, 7, 11, 8],
            [13, nil, 15, 12]            
          ]


puzzle = [
          [2, 13, 9, 8],
          [nil, 14, 7, 3],
          [1, 10, 11, 15],
          [12, 4, 6, 5]
          ]

puzzle = PuzzleSolver.solve(puzzle)

puzzle.print_swap_history

puts puzzle.to_s
=end
=begin
puzzle = [
      [1,6,2,4],
      [9,5,3,7],
      [13,10,11,8],
      [nil,14,15,12]
]
=end

puzzle = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,nil]
]


#puzzle = PuzzleSolver.solve(puzzle)

#puzzle.print_swap_history

board = Board.new(puzzle)
puts board.score