var PuzzleAI = (function(){
  "use strict";
  var AI = {};

  var board;

  AI.solve = function(b){
    board = b;
    return AI.breadthSearch();
  }

  AI.breadthSearch = function(){

    var boards = [];

    boards.push(board);

    while (boards.length > 0){
      var currentBoard = boards.pop();

      var freeSpace = currentBoard.getFreeSpace();

      var swaps = ["swapUp","swapDown","swapLeft","swapRight"];

      currentBoard.printPositions();

      for (var i = 0; i < swaps.length; i++){
        var swap_fn = swaps[i];
        var newBoard = new Board(currentBoard.getPositions());

        // perform the swap and get a boolean success indicator
        var successful_swap = newBoard[swap_fn]();

        if (successful_swap === true){
          console.log("successfully swapped: " + swap_fn);
          newBoard.printPositions();
          if (newBoard.isSolved()){
            console.log("solved!");
            return newBoard;
          }
          else{
            console.log("pushing board");
            boards.push(newBoard);
          }
        }
        else{
          console.log("could not swap: " + swap_fn);
        }
      }
    }
  }

  return AI;
})();