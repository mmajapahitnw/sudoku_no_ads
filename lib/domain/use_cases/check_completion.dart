import 'package:sudoku_no_ads/domain/entities/sudoku_board.dart';

class CheckCompletion {
  final String solution;

  const CheckCompletion(this.solution);

  bool call(SudokuBoard board) {
    var index = 0;

    for (final cell in board.cells) {
      if (cell.value == '0') return false;
      if (cell.value != solution[index]) return false;
      index++;
    }

    return true; // puzzle completed
  }
}