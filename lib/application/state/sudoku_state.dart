import '../../domain/entities/sudoku_board.dart';
import '../../domain/value_objects/position.dart';

class SudokuState {
  final SudokuBoard board;
  final List<SudokuBoard> pastBoards;
  final List<SudokuBoard> futureBoards;
  final Position? selected;
  final bool isCompleted;
  final String seed;
  final String solution;
  final String difficulty;
  final bool usingPencil;

  const SudokuState({
    this.difficulty = '',
    this.seed = '',
    this.solution = '',
    required this.board,
    this.pastBoards = const [],
    this.futureBoards = const [],
    this.selected,
    this.isCompleted = false,
    this.usingPencil = false,
  });

  SudokuState copyWith({
    SudokuBoard? board,
    Position? selected,
    bool? isCompleted,
    String? seed,
    String? solution,
    List<SudokuBoard>? pastBoards,
    List<SudokuBoard>? futureBoards,
    bool? usingPencil,
  }) {
    return SudokuState(
      board: board ?? this.board,
      selected: selected ?? this.selected,
      isCompleted: isCompleted ?? this.isCompleted,
      seed: seed ?? this.seed,
      solution: solution ?? this.solution,
      pastBoards: pastBoards ?? this.pastBoards,
      futureBoards: futureBoards ?? this.futureBoards,
      usingPencil: usingPencil ?? this.usingPencil,
    );
  }

  bool get canUndo => pastBoards.isNotEmpty;
  bool get canRedo => futureBoards.isNotEmpty;
}