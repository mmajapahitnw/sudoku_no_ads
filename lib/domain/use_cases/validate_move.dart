import '../entities/sudoku_board.dart';

class ValidateMove {
  bool _isRowValid(SudokuBoard board, int row, int col, String value) {
    return board.cells
        .where((c) => c.row == row && c.col != col)
        .every((c) => c.value != value);
  }

  bool _isColumnValid(SudokuBoard board, int row, int col, String value) {
    return board.cells
        .where((c) => c.row != row && c.col == col)
        .every((c) => c.value != value);
  }

  bool _isBoxValid(SudokuBoard board, int row, int col, String value) {
    final boxRowStart = (row ~/ 3) * 3;
    final boxColStart = (col ~/ 3) * 3;

    return board.cells
        .where((c) =>
        c.row >= boxRowStart &&
        c.row < boxRowStart + 3 &&
        c.col >= boxColStart &&
        c.col < boxColStart + 3 &&
        !(c.row == row && c.col == col))
        .every((c) => c.value != value
    );
  }

  bool call(SudokuBoard board, int row, int col, String value) {
    return _isRowValid(board, row, col, value) &&
        _isColumnValid(board, row, col, value) &&
        _isBoxValid(board, row, col, value);
  }
}