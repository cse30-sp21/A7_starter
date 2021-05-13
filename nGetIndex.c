// UCSD CSE30
// Bryan Chin
#include "nGetIndex.h"
#include <stdint.h>
#include <assert.h>
static size_t gRows = UINT32_MAX;    // private static number of rows
static size_t gCols = UINT32_MAX;    // private static number of cols


//
// nGetIndex
// calculate the offset (index) based on a board
// with numRows and numCols
// will wrap into a torus if row <0 or row >= numRows
// or col == -1 or col == numCols
//
size_t nGetIndex(size_t numRows, size_t numCols, size_t row, size_t col){
  if (row == -1)  {
    row = numRows - 1;
  }else if (row == numRows){
    row = 0;
  }
  if (col == -1){
    col = numCols - 1;
  }else if (col == numCols){
    col = 0;
  }
  return numCols * row + col;
}
  

// ------------------------------------------------------
// These two functions work together.
// call setNRowsNCols to establish a local, private copy of
// nRows and nCols. Then you can call
// nGetIndexRC without specifying the number of rows and
// columns each time.
// 
//! set the private number of rows and cols.
//! 
void setNRowsNCols(size_t r, size_t c){
  gRows = r;
  gCols = c;
}

//! assumes you have already called setNRowsNCols
//!
size_t nGetIndexRC(size_t r, size_t c){
  assert(gRows != UINTMAX_MAX);
  assert(gCols != UINTMAX_MAX);
  return(nGetIndex(gRows, gCols, r, c));
}
  
