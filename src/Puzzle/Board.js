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


  // swap two positions in the grid
  // each position is an array of x,y coords
  Board.prototype.swap = function(pos1,pos2){
    var tmp = positions[pos1[0]][pos1[1]];

    positions[pos1[0]][pos1[1]] = positions[pos2[0]][pos2[1]];
    
    positions[pos2[0]][pos2[1]] = tmp;
  }

  // boolean check if table is in solved state. 
  // Checks each position. 
  Board.prototype.isSolved = function(){
    var number = 0;

    // loop through each row and column
    for (var i = 0; i < positions.length; i++){
      for (var j = 0; j < positions[i].length; j++){
        if (positions[i][j] != number){
          // number should always match value, except when the last square
          // in this case, the value is null. 
          if (i != positions.length -1 && j != positions[i].length -1){
            return false;
          }
        }
        number++;
      }
    }

    return true;
  }

  return Board;
})();
