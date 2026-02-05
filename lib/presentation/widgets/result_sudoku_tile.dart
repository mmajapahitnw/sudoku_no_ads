import 'package:flutter/material.dart';

class ResultSudokuTile extends StatelessWidget {
  final int index;
  final int col;
  final int row;
  final String puzzle;
  final String solution;

  const ResultSudokuTile({required this.index, required this.col, required this.row, required this.solution, required this.puzzle, super.key});

  @override
  Widget build(BuildContext context) {
    final isThickBorderTop = row % 3 == 0;
    final isThickBorderLeft = col % 3 == 0;
    final isThickBorderRight = col == 8;
    final isThickBorderBot = row == 8;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: isThickBorderTop ? 2 : 0.5),
          left: BorderSide(width: isThickBorderLeft ? 2 : 0.5),
          right: BorderSide(width: isThickBorderRight ? 2 : 0.5),
          bottom: BorderSide(width: isThickBorderBot ? 2 : 0.5),
        )
      ),
      child: Center(
        child: Text(solution[index],
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: puzzle[index] != '0'
                ? FontWeight.bold
                : FontWeight.normal,
            color: puzzle[index] != '0' ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }
}