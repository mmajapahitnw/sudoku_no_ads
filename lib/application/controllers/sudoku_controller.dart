import 'package:flutter_riverpod/legacy.dart';
import 'package:sudoku_no_ads/application/state/sudoku_state.dart';
import 'package:sudoku_no_ads/domain/entities/sudoku_board.dart';
import 'package:sudoku_no_ads/domain/use_cases/fetch_puzzle.dart';
import 'package:sudoku_no_ads/domain/use_cases/generate_sudoku.dart';
import '../../domain/use_cases/select_cell.dart';
import '../../domain/use_cases/validate_move.dart';

class SudokuController extends StateNotifier<SudokuState> {
  final SelectCell _selectCell;
  final ValidateMove _validateMove;
  final GenerateSudoku _generateSudoku;
  final FetchPuzzle _fetchPuzzle;

  SudokuController(
    this._selectCell,
    this._validateMove,
    this._generateSudoku,
    this._fetchPuzzle,
  ) : super(SudokuState(board: SudokuBoard.empty()));

  void selectCell(int row, int col) {
    state = state.copyWith(selected: _selectCell(row, col));
  }

  void inputNumber(String value, {bool fromHint = false}) {
    final valueInt = int.parse(value);
    final selected = state.selected;
    final usingPencil = state.usingPencil;
    if (selected == null) return; // escape if no cell is being selected

    final cell = state.board.cellAt(selected.row, selected.col);
    Set<int> pencilMarks = {...cell.pencilMarks};

    if (cell.isFixed) return; // escape is the cell's value is given from puzzle

    if (usingPencil) { // input when pencil is on
      if (cell.value != '0') return;
      // pencilMarks.add(int.parse(value));
      pencilMarks.add(valueInt);
      value = '0';
    } else { // input when pencil is off
      if (!_validateMove(state.board, selected.row, selected.col, value)) {
        return; // the move is invalid
      }
      pencilMarks = <int>{};
    }

    final updatedBoard = state.board.updateCell(
      selected.row,
      selected.col,
      value,
      pencilMarks,
    );

    final completed = _checkCompletion(updatedBoard, state.puzzle.solution);
    final updatedPastBoards = [...state.pastBoards, state.board];

    if (fromHint) {
      state = state.copyWith(
        board: updatedBoard,
        pastBoards: updatedPastBoards,
        futureBoards: [],
        isCompleted: completed,
        hintUsed: state.hintUsed + 1,
      );
    } else {
      state = state.copyWith(
        board: updatedBoard,
        pastBoards: updatedPastBoards,
        futureBoards: [],
        isCompleted: completed,
      );
    }
  }

  void clearCell() {
    final selected = state.selected;
    if (selected == null) return; // null unwrapper kinda

    final cell = state.board.cellAt(
      selected.row,
      selected.col,
    ); // dang swift wouldn't allow this
    if (cell.isFixed) return;

    final updatedBoard = state.board.updateCell(
      selected.row,
      selected.col,
      '0',
      const <int>{},
    );
    final updatedPastBoards = [...state.pastBoards, state.board];

    state = state.copyWith(
      board: updatedBoard,
      pastBoards: updatedPastBoards,
      futureBoards: [],
      isCompleted: false,
    );
  }

  void undo() {
    if (!state.canUndo) return;

    final updatedBoard = state.pastBoards.last;
    final updatedPastBoards = state.pastBoards.sublist(
      0,
      state.pastBoards.length - 1,
    );
    final updatedFutureBoards = [state.board, ...state.futureBoards];

    state = state.copyWith(
      board: updatedBoard,
      pastBoards: updatedPastBoards,
      futureBoards: updatedFutureBoards,
      isCompleted: false,
    );
  }

  void redo() {
    if (!state.canRedo) return;

    final updatedBoard = state.futureBoards[0];
    final updatedPastBoards = [...state.pastBoards, state.board];
    List<SudokuBoard> updatedFutureBoards = [];
    final length = state.futureBoards.length;

    if (length > 1) {
      updatedFutureBoards = state.futureBoards.sublist(1, length);
    }

    state = state.copyWith(
      board: updatedBoard,
      pastBoards: updatedPastBoards,
      futureBoards: updatedFutureBoards,
    );
  }

  Future<void> newGame(String difficulty) async {
    final newPuzzle = await _fetchPuzzle.fetchData(difficulty);
    final board = _generateSudoku(newPuzzle.puzzle);

    state = SudokuState(
      board: board,
      puzzle: newPuzzle,
    );
  }

  bool _checkCompletion(SudokuBoard board, String solution) {
    var index = 0;

    for (final cell in board.cells) {
      if (cell.value == '0') {
        return false;
      }
      if (cell.value != solution[index]) {
        return false;
      }
      index++;
    }

    return true; // puzzle completed
  }

  void pencilToggle() {
    state = state.copyWith(usingPencil: !state.usingPencil);
  }

  void giveHint() {
    final cell = state.board.cellAt(state.selected.row, state.selected.col);

    if (cell.value != '0') return;

    final index = state.selected.row * 9 + state.selected.col;
    inputNumber(state.puzzle.solution[index], fromHint: true);
  }
}
