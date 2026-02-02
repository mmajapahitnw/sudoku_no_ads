class GameTimer {
  final Duration elapsed;
  final bool isRunning;
  final Duration offset;

  const GameTimer({
    required this.elapsed,
    required this.isRunning,
    this.offset = Duration.zero,
  });

  GameTimer copyWith({
    Duration? elapsed,
    bool? isRunning,
    Duration? offset,
  }) {
    return GameTimer(
      elapsed: elapsed ?? this.elapsed,
      isRunning: isRunning ?? this.isRunning,
      offset: offset ?? this.offset,
    );
  }

  static const initial = GameTimer(
    elapsed: Duration.zero,
    isRunning: false,
    offset: Duration.zero,
  );

  Duration get time => offset + elapsed;
}