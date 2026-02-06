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
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            MaterialButton(
              textColor: Colors.black54,
              onPressed: () => controller.clearCell(),
              child: Column(
                spacing: 2,
                children: [
                  Icon(Icons.backspace_outlined),
                  Text(
                    'Erase',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Spacer(),
            MaterialButton(
              textColor: Colors.black54,
              onPressed: () => controller.undo(),
              child: Column(
                spacing: 2,
                children: [
                  Icon(Icons.undo),
                  Text(
                    'Undo',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Spacer(),
            MaterialButton(
              textColor: Colors.black54,
              onPressed: () => controller.giveHint(),
              child: Column(
                spacing: 2,
                children: [
                  Icon(Icons.lightbulb),
                  Text(
                    'Hint',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Spacer(),
            MaterialButton(
              textColor: Colors.black54,
              onPressed: () => controller.pencilToggle(),
              child: Column(
                spacing: 2,
                children: [
                  Icon(state.usingPencil ? Icons.edit : Icons.edit_off,
                  color: state.usingPencil ? Colors.indigoAccent : Colors.black54,),
                  Text(
                    'Pencil',
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
        Wrap(
          alignment: .center,
          spacing: 4,
          children: [
            ...List.generate(9, (index) {
              final number = index + 1;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => controller.inputNumber(number.toString()),
                child: Column(
                  spacing: 0,
                  children: [
                    Text(
                      number.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        color: state.usingPencil ? Colors.black54 : Colors.indigoAccent,
                        fontWeight: .w400,
                      ),
                    ),
                    Text(
                      '',
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
