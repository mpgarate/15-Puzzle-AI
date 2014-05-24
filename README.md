15-N Puzzle AI
===============

A 15 puzzle solver written in Ruby. The puzzle can have any dimensions, not just the typical 4x4 of a 15 puzzle.

The algorithm uses a breadth first search and a diagonal shortcut heuristic outlined [here](http://www.policyalmanac.org/games/heuristics.htm). A min heap is used to prioritize board states with this heuristic. This produces a correct solution very fast, although it is not the shortest path solution. The board state tree is pruned to ignore undoing the previous move. Other cycles are possible, but they will never be the optimal next board as defined by the heuristic.

To quickly get a sense of what this code does, look at ```puzzle_solver/ai.rb``` to get an overview of the algorithm and ```puzzle_solver/board.rb``` to see its supporting implementation.

There are a number of improvements I have in mind.

TODO:

* ~~It is not necessary to recompute the heuristic for each point on the grid for every new board. Since each board is a child of another board, the heuristic score can be adjusted by only calculating the changed tiles. This improvement may be negligible.~~

* Compare results with an iterative deepending algorithm like [IDA*](en.wikipedia.org/wiki/IDA*).

* In another project, try an AI based on the human approach. Solve the top row except the rightmost two spaces. Solve the next row down similarly until only two remain, and then solve columns. A method similar to this could quickly produce a fairly short path, although not necessarily the optimal path. 
