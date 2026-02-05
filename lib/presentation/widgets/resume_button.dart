import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class ResumeButton extends ConsumerWidget {
  const ResumeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.read(timerControllerProvider.notifier);
    final sudokuState = ref.watch(sudokuControllerProvider);
    final timerState = ref.watch(timerControllerProvider);
    final isButtonActive =
        sudokuState.puzzle.puzzle != '' && !sudokuState.isCompleted;

    return ElevatedButton(
      onPressed: () {
        if (isButtonActive) {
          timer.start();
          context.go(context.namedLocation('gamePlay'));
        }
      },
      child: Text(
        'Resume',
        style: TextStyle(
          color: isButtonActive ? Colors.blue : Colors.black45,
        ),
      ),

      // if (isButtonActive)
      //   Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(sudokuState.puzzle.difficulty),
      //       const SizedBox(width: 12,),
      //       Text(formatDuration(timerState.time)),
      //     ],
      //   ),
    );
  }
}
