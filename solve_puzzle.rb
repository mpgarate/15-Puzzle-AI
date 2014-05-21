require './puzzle_solver.rb'

puzzle = [
            [  1,  2,  3,  nil],
            [  5,  7,  11,  4],
            [  9, 6, 12, 8],
            [ 13, 10, 14, 15]
          ]

PuzzleSolver.solve(puzzle)