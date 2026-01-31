import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku_no_ads/application/providers/sudoku_providers.dart';

class InputPad extends ConsumerWidget {
  const InputPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sudokuControllerProvider);
    final controller = ref.read(sudokuControllerProvider.notifier);

    return Column(
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.backspace_outlined),
            ),
            ElevatedButton(
              onPressed: () => controller.undo(),
              child: Icon(Icons.undo),
            ),
            ElevatedButton(
              onPressed: () => controller.redo(),
              child: Icon(Icons.redo),
            ),
            ElevatedButton(
              onPressed: () => controller.pencilToggle(),
              child: Icon(state.usingPencil ? Icons.edit : Icons.edit_outlined),
            ),
          ],
        ),
        Wrap(
          alignment: .center,
          children: [
            ...List.generate(9, (index) {
              final number = index + 1;
              return Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  onPressed: () => controller.inputNumber(number.toString()),
                  child: Column(
                    children: [
                      Text(number.toString(), style: TextStyle(fontSize: 20)),
                      Text('9', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
