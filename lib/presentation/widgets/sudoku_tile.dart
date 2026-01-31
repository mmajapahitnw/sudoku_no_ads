import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/sudoku_providers.dart';

class SudokuTile extends ConsumerWidget {
  final int row;
  final int col;

  const SudokuTile({super.key, required this.row, required this.col});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sudokuControllerProvider);
    final controller = ref.read(sudokuControllerProvider.notifier);

    final cell = state.board.cellAt(row, col);
    final isSelected = state.selected?.row == row && state.selected?.col == col;

    final isThickBorderTop = row % 3 == 0;
    final isThickBorderLeft = col % 3 == 0;
    final isThickBorderRight = col == 8;
    final isThickBorderBot = row == 8;

    return GestureDetector(
      onTap: () => controller.selectCell(row, col),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: isThickBorderTop ? 2 : 0.5),
            left: BorderSide(width: isThickBorderLeft ? 2 : 0.5),
            right: BorderSide(width: isThickBorderRight ? 2 : 0.5),
            bottom: BorderSide(width: isThickBorderBot ? 2 : 0.5),
          ),
          color: isSelected ? Colors.cyan[50] : Colors.white,
        ),
        child: Center(
          child: cell.pencilMarks.isEmpty
              ? Text(
                  cell.value == '0' ? '' : cell.value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: cell.isFixed
                        ? FontWeight.bold
                        : FontWeight.w600,
                    color: cell.isFixed ? Colors.black : Colors.indigo,
                  ),
                )
              : GridView.count(
                  crossAxisCount: 3,
                  children: [
                    ...List.generate(9, (i) {
                      final number = i + 1;
                      return Container(
                        child: Center(
                          child: Text(
                            cell.pencilMarks.contains(number) ? '${number}' : '',
                            style: TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
        ),
      ),
    );
  }
}
