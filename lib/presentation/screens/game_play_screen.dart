import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';
import 'package:sudoku_no_ads/application/state/sudoku_state.dart';
import 'package:sudoku_no_ads/presentation/widgets/game_timer_widget.dart';
import 'package:uuid/uuid.dart';
import '../../data/boxes.dart';
import '../../data/game_result.dart';
import '../widgets/sudoku_grid.dart';
import '../widgets/input_pad.dart';

class GamePlayScreen extends ConsumerWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.read(sudokuControllerProvider.notifier);
    final gameState = ref.watch(sudokuControllerProvider);
    final timer = ref.read(timerControllerProvider.notifier);
    final timerState = ref.watch(timerControllerProvider);

    ref.listen<SudokuState>(sudokuControllerProvider, (previous, next) {
      if (previous?.isCompleted == false && next.isCompleted == true) {
        // to make sure that this block of code only runs ONCE
        ref.read(timerControllerProvider.notifier).stop();

        // saving game result
        print('saving result');
        final String uuid = Uuid().v4();
        final elapsed = timerState.time;
        final puzzle = gameState.puzzle;
        boxGameResults.put(
          'key_$uuid',
          GameResult(
            id: uuid,
            completedAt: DateTime.now(),
            duration: {
              'hour': elapsed.inHours,
              'minute': elapsed.inMinutes.remainder(60),
              'second': elapsed.inSeconds.remainder(60),
            },
            puzzle: puzzle.toMap(),
          ),
        );

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
                onPressed: () {
                  context.go(context.namedLocation('home'));
                },
                child: const Text('MainMenu'),
              ),
            ],
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
          timer.pause();
        }, icon: const Icon(Icons.arrow_back)),
        backgroundColor: Color.fromRGBO(227, 228, 237, 1),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.pause))],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              spacing: 4,
              children: [
                Spacer(),
                Text(
                  gameState.puzzle.difficulty,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigoAccent,
                    fontWeight: .w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Hints used: 0',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                        fontWeight: .w600,
                      ),
                    ),
                    Spacer(),
                    GameTimerWidget(),
                  ],
                ),
                SudokuGrid(),
                SizedBox(height: 8,),
                InputPad(),
                Spacer(flex: 2,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
