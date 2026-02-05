import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/application/helpers/capitalize.dart';
import 'package:sudoku_no_ads/data/game_result.dart';
import 'package:sudoku_no_ads/presentation/widgets/result_sudoku_grid.dart';

class ResultDetailScreen extends StatelessWidget {
  final GameResult result;

  const ResultDetailScreen({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(227, 228, 237, 1),
        title: Text('${result.puzzle['difficulty']}'.capitalize() + ' Puzzle'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              ResultSudokuGrid(puzzle: result.puzzle['puzzle']!, solution: result.puzzle['solution']!,),
              SizedBox(height: 8,),
              Divider(color: Colors.black54,),
              SizedBox(height: 8,),
              Text('Difficulty: ${result.puzzle['difficulty']!.capitalize()}'),
              Text('Completed at: ${result.completedAt.toString().substring(0, 16)}'),
              Text('Time: ${result.duration['minute'].toString().padLeft(2, '0')}:${result.duration['second'].toString().padLeft(2, '0')}'),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}