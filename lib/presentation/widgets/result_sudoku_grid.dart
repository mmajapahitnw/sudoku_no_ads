import 'package:flutter/material.dart';
import 'result_sudoku_tile.dart';

class ResultSudokuGrid extends StatelessWidget {
  final String puzzle;
  final String solution;

  const ResultSudokuGrid({required this.puzzle, required this.solution, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
        itemCount: 81,
        itemBuilder: (context, index) {
          final col = index % 9;
          final row = index ~/ 9;
          return ResultSudokuTile(index: index, col: col, row: row, puzzle: puzzle, solution: solution,);
        },
      ),
    );
  }
}