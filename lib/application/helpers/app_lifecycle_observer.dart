import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  final Ref ref;

  AppLifecycleObserver(this.ref);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final timer = ref.read(timerControllerProvider.notifier);

    if (state ==AppLifecycleState.paused) {
      timer.pause();
    } else if (state == AppLifecycleState.resumed) {
      timer.start();
    }
  }
}