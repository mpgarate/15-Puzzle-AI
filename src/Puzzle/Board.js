var Board = (function(){
  "use strict";

  // matrx of 4x4 grid
  var positions = [];


  // constructor
  var Board = function(arr){
    positions = arr;
  }


  Board.prototype.printPositions = function(){
    console.log(positions);
  }

  return Board;
})();
