import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  final WidgetRef ref;
  bool timePausedByAppLifecycle;

  AppLifecycleObserver(this.ref, {this.timePausedByAppLifecycle = false});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final timer = ref.read(timerControllerProvider.notifier);
    final timerState = ref.watch(timerControllerProvider);

    if (state == AppLifecycleState.paused) {
      if (timerState.isRunning) timePausedByAppLifecycle = true;
      timer.pause();
    } else if (state == AppLifecycleState.resumed) {
      if (timePausedByAppLifecycle) {
        timer.start();
        timePausedByAppLifecycle = false;
      }
    }
  }
}