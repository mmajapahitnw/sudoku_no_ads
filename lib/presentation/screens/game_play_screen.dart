import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';
import 'package:sudoku_no_ads/application/state/sudoku_state.dart';
import 'package:sudoku_no_ads/presentation/widgets/game_timer_widget.dart';
import '../widgets/sudoku_grid.dart';
import '../widgets/input_pad.dart';

class GamePlayScreen extends ConsumerWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sudokuControllerProvider);
    final timer = ref.read(timerControllerProvider.notifier);

    ref.listen<SudokuState>(sudokuControllerProvider, (previous, next) {
      if (previous?.isCompleted == false && next.isCompleted == true) {
        // to make sure that this block of code only runs ONCE
        ref.read(timerControllerProvider.notifier).stop();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You\'ve completed the puzzle.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
              ElevatedButton(
                onPressed: () => context.go(context.namedLocation('home')),
                child: const Text('MainMenu'),
              ),
            ],
          ),
        );
      }
    });

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  timer.pause();
                  context.go(context.namedLocation('home'));
                },
                child: const Icon(Icons.arrow_back_rounded),
              ),
              Text(
                'easy SUDOKU',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Spacer(),
              GameTimerWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SudokuGrid(),
              ),
              const Divider(height: 1),
              InputPad(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
