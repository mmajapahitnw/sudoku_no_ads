import 'package:sudoku_no_ads/domain/entities/puzzle.dart';

import '../../domain/entities/sudoku_board.dart';
import '../../domain/value_objects/position.dart';

class SudokuState {
  final SudokuBoard board;
  final List<SudokuBoard> pastBoards;
  final List<SudokuBoard> futureBoards;
  final Position selected;
  final bool isCompleted;
  final Puzzle puzzle;
  final bool usingPencil;

  const SudokuState({
    required this.board,
    this.pastBoards = const [],
    this.futureBoards = const [],
    this.selected = const Position(0, 0),
    this.isCompleted = false,
    this.usingPencil = false,
    this.puzzle = const Puzzle(difficulty: '', puzzle: '', solution: ''),
  });

  SudokuState copyWith({
    SudokuBoard? board,
    Position? selected,
    bool? isCompleted,
    Puzzle? puzzle,
    List<SudokuBoard>? pastBoards,
    List<SudokuBoard>? futureBoards,
    bool? usingPencil,
  }) {
    return SudokuState(
      board: board ?? this.board,
      selected: selected ?? this.selected,
      isCompleted: isCompleted ?? this.isCompleted,
      puzzle: puzzle ?? this.puzzle,
      pastBoards: pastBoards ?? this.pastBoards,
      futureBoards: futureBoards ?? this.futureBoards,
      usingPencil: usingPencil ?? this.usingPencil,
    );
  }

  bool get canUndo => pastBoards.isNotEmpty;
  bool get canRedo => futureBoards.isNotEmpty;
}