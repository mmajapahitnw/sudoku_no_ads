class GameTimer {
  final Duration elapsed;
  final bool isRunning;

  const GameTimer({
    required this.elapsed,
    required this.isRunning,
  });

  GameTimer copyWith({
    Duration? elapsed,
    bool? isRunning,
  }) {
    return GameTimer(
      elapsed: elapsed ?? this.elapsed,
      isRunning: isRunning ?? this.isRunning
    );
  }

  static const initial = GameTimer(
    elapsed: Duration.zero,
    isRunning: false
  );
}