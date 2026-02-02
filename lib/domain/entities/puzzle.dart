class Puzzle {
  final String difficulty;
  final String puzzle;
  final String solution;

  const Puzzle({
    required this.difficulty,
    required this.puzzle,
    required this.solution,
  });

  factory Puzzle.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'difficulty': String difficulty,
        'puzzle': String puzzle,
        'solution': String solution,
      } =>
        Puzzle(difficulty: difficulty, puzzle: puzzle, solution: solution),
      _ => throw const FormatException('Failed to load puzzle'),
    };
  }
}
