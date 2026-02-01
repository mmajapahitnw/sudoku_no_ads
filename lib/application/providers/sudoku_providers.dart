import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sudoku_no_ads/application/controllers/sudoku_controller.dart';
import 'package:sudoku_no_ads/application/controllers/timer_controller.dart';
import 'package:sudoku_no_ads/domain/value_objects/game_timer.dart';
import '../state/sudoku_state.dart';
import 'package:sudoku_no_ads/domain/use_cases/fetch_puzzle.dart';
import 'package:sudoku_no_ads/domain/use_cases/generate_sudoku.dart';
import 'package:sudoku_no_ads/domain/use_cases/select_cell.dart';
import 'package:sudoku_no_ads/domain/use_cases/validate_move.dart';

final validateMoveProvider = Provider((_) => ValidateMove());

final selectCellProvider = Provider((_) => SelectCell());

final fetchPuzzleProvider = Provider((_) => FetchPuzzle());

final generateSudokuProvider = Provider((_) => GenerateSudoku());

final sudokuControllerProvider = StateNotifierProvider<SudokuController, SudokuState>(
  (ref) => SudokuController(
    ref.read(selectCellProvider),
    ref.read(validateMoveProvider),
    ref.read(generateSudokuProvider),
    ref.read(fetchPuzzleProvider),
  )
);

final timerControllerProvider = StateNotifierProvider<TimerController, GameTimer>(
  (ref) => TimerController(),
);
