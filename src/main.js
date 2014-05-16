/* var positions = [
                  [0,1,2,3],
                  [4,5,6,7],
                  [8, 9, 10,11],
                  [12,13,14,null]
                ]*/
var positions = [
                  [0,1,2,3],
                  [4,5,6,7],
                  [null, 9, 10,11],
                  [8,12,13,14]
                ]

var board = new Board(positions);


if (! board.isSolved()){
  board = PuzzleAI.solve(board);
}

console.log(board.getPositionOf(null));

console.log("board is solved? : " + board.isSolved());

board.printPositions();

