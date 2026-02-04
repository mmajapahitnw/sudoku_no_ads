import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku_no_ads/application/helpers/format_duration.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class GameTimerWidget extends ConsumerWidget {
  const GameTimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerControllerProvider);

    return Visibility(
      visible: timer.isRunning,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Text(
        formatDuration(timer.time),
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
          fontWeight: .w600,
        ),
      ),
    );
  }
}
