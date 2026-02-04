import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/presentation/widgets/difficulty_dialog_options.dart';
import '../widgets/menu_buttons.dart';
import '../widgets/resume_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(227, 228, 237, 1),
      ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Text('SUDOKU\nno ads',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: .center,),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    _askedDifficulty(context);
                  },
                  child: const Text('New Game'),
              ),
              ResumeButtons(label: 'Resume', routeAddress: 'gamePlay'),
              MenuButtons(label: 'History', routeAddress: 'history'),
              Spacer(),
            ],
          ),
        ),
      )
    ;
  }

  Future<void> _askedDifficulty(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select Difficulty'),
          children: [
            DifficultyDialogOptions(difficulty: 'Easy',),
            DifficultyDialogOptions(difficulty: 'Medium',),
            DifficultyDialogOptions(difficulty: 'Hard',),
          ],
        );
      }
    );
  }
}
