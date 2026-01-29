import '../../domain/entities/sudoku_board.dart';
import '../../domain/position.dart';

class SudokuState {
  final SudokuBoard board;
  final Position? selected;
  final bool isCompleted;
  final String seed;
  final String solution;
  final String difficulty;

  const SudokuState({
    this.difficulty = '',
    this.seed = '',
    this.solution = '',
    required this.board,
    this.selected,
    this.isCompleted = false,
  });

  SudokuState copyWith({
    SudokuBoard? board,
    Position? selected,
    bool? isCompleted,
    String? seed,
    String? solution,
  }) {
    return SudokuState(
      board: board ?? this.board,
      selected: selected ?? this.selected,
      isCompleted: isCompleted ?? this.isCompleted,
      seed: seed ?? this.seed,
      solution: solution ?? this.seed,
    );
  }
}