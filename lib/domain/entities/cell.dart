class Cell {
  final int row;
  final int col;
  final String value;
  final bool isFixed;

  const Cell({
    required this.row,
    required this.col,
    this.value = '0',
    this.isFixed = false,
  });

  Cell copyWith({String value = '0'}) {
    return Cell(
      row: row,
      col: col,
      value: value,
      isFixed: isFixed,
    );
  }
}
