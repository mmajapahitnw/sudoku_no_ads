import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/presentation/widgets/app_background.dart';
import '../widgets/menu_buttons.dart';
import '../widgets/resume_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text('SUDOKU\nno ads',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: .center,),
              Spacer(),
              MenuButtons(label: 'New Game', routeAddress: 'chooseDifficulty'),
              ResumeButtons(label: 'Resume', routeAddress: 'gamePlay'),
              MenuButtons(label: 'History', routeAddress: ''),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
