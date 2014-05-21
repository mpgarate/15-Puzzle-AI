require './puzzle_solver.rb'

=begin
puzzle = [
            [5,  1,  3,  2],
            [9,  6,  14,  4],
            [10, 7, 11, 8],
            [13, nil, 15, 12]            
          ]
=end

puzzle = [
          [2, 13, 9, 8],
          [nil, 14, 7, 3],
          [1, 10, 11, 15],
          [12, 4, 6, 5]
          ]


puzzle = PuzzleSolver.solve(puzzle)

puzzle.print_swap_history

puts puzzle.to_s