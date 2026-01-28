import '../../domain/entities/sudoku_board.dart';
import '../../domain/position.dart';

class SudokuState {
  final SudokuBoard board;
  final Position? selected;
  final bool isCompleted;

  const SudokuState({
    required this.board,
    this.selected,
    this.isCompleted = false,
  });

  SudokuState copyWith({
    SudokuBoard? board,
    Position? selected,
    bool? isCompleted,
  }) {
    return SudokuState(
      board: board ?? this.board,
      selected: selected ?? this.selected,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}