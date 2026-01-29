import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/presentation/widgets/difficulty_buttons.dart';
import '../widgets/menu_buttons.dart';

class ChooseDifficultyScreen extends StatelessWidget {
  const ChooseDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Text('Choose Difficulty'),
            Spacer(),
            DifficultyButtons(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}