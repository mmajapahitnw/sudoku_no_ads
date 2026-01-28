import 'package:flutter/material.dart';

class SudokuTile extends StatelessWidget {
  final int row;
  final int col;

  const SudokuTile({super.key, required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    final isThickBorderTop = row % 3 == 0;
    final isThickBorderLeft = col % 3 == 0;
    final isThickBorderRight = col == 8;
    final isThickBorderBot = row == 8;

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: isThickBorderTop ? 2 : 0.5),
            left: BorderSide(width: isThickBorderLeft ? 2 : 0.5),
            right: BorderSide(width: isThickBorderRight ? 2 : 0.5),
            bottom: BorderSide(width: isThickBorderBot ? 2 : 0.5),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}