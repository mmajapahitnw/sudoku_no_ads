import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/domain/enums/difficulty.dart';

class DifficultyDialogOptions extends ConsumerWidget {
  final String difficulty;

  const DifficultyDialogOptions({super.key, this.difficulty = '',});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(sudokuControllerProvider.notifier);
    final timer = ref.read(timerControllerProvider.notifier);

    return SimpleDialogOption(
      onPressed: () {
        Navigator.pop(context);
        controller.newGame(difficulty.toLowerCase());
        timer.reset();
        timer.start();
        context.go(
            context.namedLocation('gamePlay')
        );
      },
      child: Text(difficulty),
    );
  }
}