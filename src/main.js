var positions = [
                  [0,1,2,3],
                  [4,5,6,7],
                  [8, 9, 10,null],
                  [12,13,14,11]
                ]

var board = new Board(positions);


if (! board.isSolved()){
  PuzzleAI.solve(board);
}

console.log(board.getPositionOf(null));

console.log("board is solved? : " + board.isSolved());

