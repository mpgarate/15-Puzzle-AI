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

    var swaps = ["swapUp","swapDown","swapLeft","swapRight"];
    boards.push(board);

    while (boards.length > 0){
      var currentBoard = boards.pop();

      console.log(boards.length + " TOTAL BOARDS");

      currentBoard.printPositions();

      for (var i = 0; i < swaps.length; i++){
        var swap_fn = swaps[i];
        //var newBoard = new Board(currentBoard.getPositions());

        // perform the swap and get a new board or false
        var newBoard = currentBoard[swap_fn]();

        if (newBoard === false){
          console.log("could not swap: " + swap_fn);
        }
        else{
          console.log("successfully swapped: " + swap_fn);
          if (newBoard.isSolved()){
            console.log("solved!");
            return newBoard;
          }
          else{
            console.log("pushing board");
            newBoard.printPositions();
            boards.push(newBoard);
          }
        }
      }
    }
  }

  return AI;
})();