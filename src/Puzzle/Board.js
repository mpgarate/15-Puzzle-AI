var Board = (function(){
  "use strict";

  // matrix of 4x4 grid
  var positions = [];

  // coords of the free space
  var freeSpace = [];

  // integer, assumed to be square board
  var boardSize;


  // constructor
  var Board = function(arr){
    
    /// copy board values
    for (var i = 0; i < arr.length; i++){
      positions[i] = arr[i];
    }

    boardSize = positions.length;
    freeSpace = this.getPositionOf(null);
  }

  Board.prototype.getPositions = function(){
    return positions;
  }

  Board.prototype.getFreeSpace = function(){
    return freeSpace;
  }

  Board.prototype.getValidSwaps = function(){
    var f_row = freeSpace[0];
    var f_col = freeSpace[1];

    var fp1_row = (f_row + 1);
    var fp1_col = (f_col + 1);
    var fm1_row = (f_row - 1);
    var fm1_col = (f_col - 1);

    // which tile to move:
    
    //           right            left            up              down
    var swaps = [[f_row,fp1_col],[f_row,fm1_col],[fp1_row,f_col],[fm1_row,f_col]];
    var validSwaps = [];

    for (var i = 0; i < swaps.length; i++){
      var validSwap = true;
      for (var j = 0; j < 2; j++){      
        if (swaps[i][j] >= boardSize || swaps[i][j] < 0){
          validSwap = false;
        }
      }

      if (validSwap === true){
        validSwaps.push([swaps[i]]);
      }
    }

    return validSwaps;
  }

  Board.prototype.getPositionOf = function(target){
    for (var i = 0; i < positions.length; i++){
      for (var j = 0; j < positions.length; j++){
        if (positions[i][j] == target){
          return [i,j];
        }
      }
    }
  }

  Board.prototype.printPositions = function(){
    console.log(positions);
  }


  Board.prototype.swapUp = function(){
    if (freeSpace[0] === 0){
      // invalid swap
      return false;
    }
    else {
      var freeRow = freeSpace[0];
      var freeCol = freeSpace[1];
      var swapRow = freeRow + 1;
      var swapCol = freeCol;

      swap([freeRow,freeCol],[swapRow,swapCol]);

      return true;
    }
  }

  Board.prototype.swapDown = function(){
    if (freeSpace[0] === boardSize){
      // invalid swap
      return false;
    }
    else {
      var freeRow = freeSpace[0];
      var freeCol = freeSpace[1];
      var swapRow = freeRow - 1;
      var swapCol = freeCol;

      swap([freeRow,freeCol],[swapRow,swapCol]);

      return true;
    }
  }

  Board.prototype.swapLeft = function(){
    if (freeSpace[1] === 0){
      // invalid swap
      return false;
    }
    else {
      var freeRow = freeSpace[0];
      var freeCol = freeSpace[1];
      var swapRow = freeRow;
      var swapCol = freeCol - 1;

      swap([freeRow,freeCol],[swapRow,swapCol]);

      return true;
    }
  }


  Board.prototype.swapRight = function(){
    if (freeSpace[1] === boardSize){
      // invalid swap
      return false;
    }
    else {
      var freeRow = freeSpace[0];
      var freeCol = freeSpace[1];
      var swapRow = freeRow;
      var swapCol = freeCol +  1;

      swap([freeRow,freeCol],[swapRow,swapCol]);

      return true;
    }
  }

  // swap two positions in the grid
  // each position is an array of x,y coords
  function swap(pos1,pos2){
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
          if (i != positions.length -1 || j != positions[i].length -1){
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
