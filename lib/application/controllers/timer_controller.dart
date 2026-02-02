import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sudoku_no_ads/domain/value_objects/game_timer.dart';

class TimerController extends StateNotifier<GameTimer> {
  TimerController() : super(GameTimer.initial);

  final Stopwatch _stopwatch = Stopwatch();
  Timer? _ticker;

  void start() {
    if (_stopwatch.isRunning) return;

    _stopwatch.start();
    state = state.copyWith(isRunning: true);

    _ticker ??= Timer.periodic(const Duration(seconds: 1), (_){
      state = state.copyWith(elapsed: _stopwatch.elapsed);
    });
  }

  void pause() {
    _stopwatch.stop();
    final newOffset = state.offset + _stopwatch.elapsed;
    _stopwatch.reset();
    state = state.copyWith(isRunning: false, offset: newOffset);
  }

  void reset() {
    _stopwatch..stop()..reset();

    _ticker?.cancel();
    _ticker = null;

    state = GameTimer.initial;
  }

  void stop() {
    pause();
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}