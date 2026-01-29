import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class DifficultyButtons extends ConsumerWidget {
  const DifficultyButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(sudokuControllerProvider.notifier);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.newGame();
            context.go(
                context.namedLocation('gamePlay')
            );
          },
          child: Text('Easy'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.newGame();
            context.go(
                context.namedLocation('gamePlay')
            );
          },
          child: Text('Medium'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.newGame();
            context.go(
                context.namedLocation('gamePlay')
            );
          },
          child: Text('Hard'),
        ),
      ],
    );
  }
}
