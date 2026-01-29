import 'package:flutter_riverpod/legacy.dart';
import 'package:sudoku_no_ads/application/state/sudoku_state.dart';
import 'package:sudoku_no_ads/domain/entities/sudoku_board.dart';
import 'package:sudoku_no_ads/domain/enums/difficulty.dart';
import 'package:sudoku_no_ads/domain/use_cases/check_completion.dart';
import 'package:sudoku_no_ads/domain/use_cases/generate_sudoku.dart';
import '../../domain/use_cases/select_cell.dart';
import '../../domain/use_cases/validate_move.dart';

class SudokuControllers extends StateNotifier<SudokuState> {
  final SelectCell _selectCell;
  final ValidateMove _validateMove;
  final CheckCompletion _checkCompletion;
  final GenerateSudoku _generateSudoku;

  SudokuControllers(
      this._selectCell,
      this._validateMove,
      this._checkCompletion,
      this._generateSudoku,
      ) : super(SudokuState(board: SudokuBoard.empty()));

  void selectCell(int row, int col) {
    state = state.copyWith(selected: _selectCell(row, col));
  }

  void inputNumber(String value) {
    final selected = state.selected;
    if (selected == null) return; // escape if no cell is being selected

    final cell = state.board.cellAt(selected.row, selected.col);
    if (cell.isFixed) return; // escape is the cell's value is given from puzzle

    if (!_validateMove(
      state.board,
      selected.row,
      selected.col,
      value,
    )) {
      return; // the move is invalid
    }
    
    final updatedBoard = state.board.updateCell(selected.row, selected.row, value,);

    final completed = _checkCompletion(updatedBoard);
    
    state = state.copyWith(
      board: updatedBoard,
      isCompleted: completed,
    );
  }
  
  void clearCell() {
    final selected = state.selected;
    if (selected == null) return; // null unwrapper kinda
    
    final cell = state.board.cellAt(selected.row, selected.col); // dang swift wouldn't allow this
    if (cell.isFixed) return;
    
    final updatedBoard = state.board.updateCell(selected.row, selected.col, '0');

    state = state.copyWith(
      board: updatedBoard,
      isCompleted: false,
    );
    
    void newGame(Difficulty difficulty) {
      final board = _generateSudoku(difficulty);
      state = SudokuState(board: board,);
    }
  }
}