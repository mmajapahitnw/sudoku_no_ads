import 'package:flutter/material.dart';
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
            MenuButtons(label: 'Easy', routeAddress: 'gamePlay'),
            MenuButtons(label: 'Medium', routeAddress: ''),
            MenuButtons(label: 'Hard', routeAddress: ''),
            Spacer(),
          ],
        ),
      ),
    );
  }
}