import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/menu_buttons.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Text('SUDOKU'),
            Text('no ads'),
            Spacer(),
            MenuButtons(label: 'New Game', routeAddress: 'chooseDifficulty'),
            MenuButtons(label: 'Resume', routeAddress: ''),
            MenuButtons(label: 'History', routeAddress: ''),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
