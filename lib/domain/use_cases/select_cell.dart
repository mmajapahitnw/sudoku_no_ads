import '../value_objects/position.dart';

class SelectCell {
  Position call(int row, int col) {
    return Position(row, col);
  }
}