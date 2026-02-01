import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/presentation/widgets/difficulty_buttons.dart';
import '../widgets/app_background.dart';

class ChooseDifficultyScreen extends StatelessWidget {
  const ChooseDifficultyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text('Choose Difficulty',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: .center),
              Spacer(),
              DifficultyButtons(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}