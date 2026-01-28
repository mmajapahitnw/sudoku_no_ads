import 'package:flutter/material.dart';
import '../widgets/sudoku_grid.dart';
import '../widgets/input_pad.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:  Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SudokuGrid(),
              )
            ),
            const Divider(height: 1),
            const Expanded(child: InputPad()),
          ],
        ),
      )
    );
  }
}

