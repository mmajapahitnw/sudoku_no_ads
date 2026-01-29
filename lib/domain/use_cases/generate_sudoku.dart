import 'package:sudoku_no_ads/domain/entities/sudoku_board.dart';
import 'package:sudoku_no_ads/domain/enums/difficulty.dart';
import 'package:sudoku_no_ads/domain/use_cases/fetch_puzzle.dart';
import '../entities/cell.dart';

class GenerateSudoku {
  final FetchPuzzle _fetchPuzzle;

  GenerateSudoku(this._fetchPuzzle);

  SudokuBoard call(Difficulty difficulty) {
    final seed = _fetchPuzzle.seed();
    final solution = _fetchPuzzle.solution();

    return SudokuBoard.fromSeed(seed);
  }
}