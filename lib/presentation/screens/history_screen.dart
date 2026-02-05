import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/data/boxes.dart';
import 'package:sudoku_no_ads/data/game_result.dart';
import 'package:sudoku_no_ads/presentation/widgets/game_result_tile.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(227, 228, 237, 1),
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: boxGameResults.length,
          itemBuilder: (context, index) {
            GameResult result = boxGameResults.getAt(index);
            return GameResultTile(result: result);
            // return ListTile(
            //   leading: IconButton(
            //     onPressed: () {
            //       boxGameResults.deleteAt(index);
            //     },
            //     icon: const Icon(Icons.remove),
            //   ),
            //   title: Text('${result.puzzle['difficulty']} Sudoku'),
            //   subtitle: Text(result.completedAt.toString().substring(0,16)),
            // );
          },
        ),
      ),
    );
  }
}
