import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class ResumeButtons extends ConsumerWidget {
  final String label;
  final String routeAddress;

  const ResumeButtons({required this.label, required this.routeAddress, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.read(timerControllerProvider.notifier);

    return ElevatedButton(
        onPressed: () {
          if (routeAddress != '') {
            timer.start();
            context.go(
                context.namedLocation(routeAddress)
            );
          }
        },
        child: Text(label)
    );
  }
}