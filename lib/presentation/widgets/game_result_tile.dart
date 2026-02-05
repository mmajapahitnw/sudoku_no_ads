import 'package:flutter/material.dart';
import 'package:sudoku_no_ads/application/helpers/capitalize.dart';
import 'package:sudoku_no_ads/data/game_result.dart';

class GameResultTile extends StatelessWidget {
  final GameResult result;

  const GameResultTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
        left: 6,
        right: 6,
        top: 6
      ),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text('${result.puzzle['difficulty']} Puzzle'.capitalize(), // stupid ahh null default value
            style: TextStyle(
              color: Colors.blue,
              fontWeight: .w500,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Text(result.completedAt.toString().substring(0, 16),
                style: TextStyle(
                  color: Colors.black54
                ),
              ),
              Spacer(),
              Icon(Icons.timer,
                color: Colors.blueGrey,
                size: 18,
              ),
              Text(
                ' ${result.duration['minute'].toString().padLeft(2, '0')}:${result.duration['second'].toString().padLeft(2, '0')}',
                style: TextStyle(color: Colors.blueGrey,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
