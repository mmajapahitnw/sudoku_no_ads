import 'cell.dart';

class SudokuBoard {
  final List<Cell> cells;

  const SudokuBoard(this.cells);

  factory SudokuBoard.fromSeed(String seed) {
    return SudokuBoard(
      List.generate(
        81,
        (index) => Cell(
            row: index ~/ 9,
            col: index % 9,
            value: seed[index]
        )
      )
    );
  }

  Cell cellAt(int row, int col) {
    return cells.firstWhere((c) => c.row == row && c.col == col);
  }

  SudokuBoard updateCell(int row, int col, String value) {
    return SudokuBoard(
      cells.map((cell) {
        if (cell.row == row && cell.col == col && !cell.isFixed) {
          return cell.copyWith(value: value);
        }
        return cell;
      }).toList(),
    );
  }
}