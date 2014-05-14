var PuzzleAI = (function(){
  "use strict";
  var AI = {};

  var board;

  AI.solve = function(b){
    board = b;
    AI.breadthSearch();
  }

  AI.breadthSearch = function(){
    var freeSpace = board.getFreeSpace();

    var validSwaps = board.getValidSwaps();

    for (var i = 0; i < validSwaps.length; i++){
      var newBoard = new Board(board.getPositions());
      console.log("calling swap on: " + validSwaps[i])
      newBoard.swap(validSwaps[i],freeSpace);
      if (newBoard.isSolved){
        console.log("solved with swap: " + validSwaps[i]);
        board.swap(validSwaps[i],freeSpace);
      }
    }
  }

  return AI;
})();