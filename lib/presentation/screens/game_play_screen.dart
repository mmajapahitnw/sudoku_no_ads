import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';
import '../widgets/sudoku_grid.dart';
import '../widgets/input_pad.dart';

class GamePlayScreen extends ConsumerWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sudokuControllerProvider);

    if (state.isCompleted) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: const Text('You\'ve completed the puzzle'),
          actions: [
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK')),
            ElevatedButton(onPressed: () => context.go('/'), child: const Text('Main Menu')),
          ],
        );
      });
    }

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

