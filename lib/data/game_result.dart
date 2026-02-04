import 'package:hive/hive.dart';
import 'package:sudoku_no_ads/domain/entities/puzzle.dart';

part 'game_result.g.dart';

@HiveType(typeId: 1)
class GameResult {
  GameResult({
    required this.id,
    required this.completedAt,
    required this.duration,
    required this.puzzle,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime completedAt;

  @HiveField(2)
  Map<String, int> duration;

  @HiveField(3)
  Map<String, String> puzzle;
}

// command to auto generate .g.dart file
// flutter packages pub run build_runner build
// if that failed use this instead
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
