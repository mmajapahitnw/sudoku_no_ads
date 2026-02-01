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

    // if (state.isCompleted) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Congratulations!'),
    //         content: const Text('You\'ve completed the puzzle'),
    //         actions: [
    //           ElevatedButton(
    //             onPressed: () => Navigator.of(context).pop(),
    //             child: Text(
    //               'OK',
    //               style: Theme.of(context).textTheme.bodyMedium,
    //             ),
    //           ),
    //           ElevatedButton(
    //             onPressed: () => context.go('/'),
    //             child: Text(
    //               'Main Menu',
    //               style: Theme.of(context).textTheme.bodyMedium,
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              Text('easy SUDOKU',
              style: Theme.of(context).textTheme.displayLarge,),
              Spacer(),
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
