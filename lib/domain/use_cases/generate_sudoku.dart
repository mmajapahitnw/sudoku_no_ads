import 'package:sudoku_no_ads/domain/entities/sudoku_board.dart';

class GenerateSudoku {

  SudokuBoard call(String seed) {
    return SudokuBoard.fromSeed(seed);
  }
}