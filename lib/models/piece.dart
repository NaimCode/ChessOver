import 'package:chess_over/data/assets.dart';
import 'package:chess_over/models/board.dart';
import 'package:chess_over/models/enum.dart';

enum CheckMovableType { empty, own, ennemy }

abstract class Piece {
  late String img;
  PieceType type;

  Piece({required this.type});
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board});

  CheckMovableType _checkMovable(Square square) {
    if (square.pieace != null) {
      if (square.pieace!.type != type) {
        square.changeActive();
      }
      return CheckMovableType.own;
    } else {
      square.changeActive();
      return CheckMovableType.empty;
    }
  }

  //? Methods
  void _knightMovable(
      {required int col, required int raw, required List<List<Square>> board}) {
    if (col >= 1 && raw >= 2) board[col - 1][raw - 2].changeActive();
    if (col >= 2 && raw >= 1) board[col - 2][raw - 1].changeActive();
    //?part 2
    if (col >= 1 && raw < 6) board[col - 1][raw + 2].changeActive();
    if (col >= 2 && raw < 7) board[col - 2][raw + 1].changeActive();
    //?part3
    if (raw >= 2 && col < 7) board[col + 1][raw - 2].changeActive();
    if (raw >= 1 && col < 6) board[col + 2][raw - 1].changeActive();
    //?part 4
    if (raw < 6 && col < 7) board[col + 1][raw + 2].changeActive();
    if (raw < 7 && col < 6) board[col + 2][raw + 1].changeActive();
  }

  void _kingMovable(
      {required int col, required int raw, required List<List<Square>> board}) {
    //?part1
    if (col >= 1) board[col - 1][raw].changeActive();
    if (col < 7) board[col + 1][raw].changeActive();
    //?part2
    if (raw >= 1) board[col][raw - 1].changeActive();
    if (raw < 7) board[col][raw + 1].changeActive();
    //?part3
    if (raw >= 1 && col >= 1) board[col - 1][raw - 1].changeActive();
    if (raw < 7 && col < 7) board[col + 1][raw + 1].changeActive();
    //?part4
    if (raw >= 1 && col < 7) board[col + 1][raw - 1].changeActive();
    if (raw < 7 && col >= 1) board[col - 1][raw + 1].changeActive();
  }

  void _queenMovable(
      {required int col, required int raw, required List<List<Square>> board}) {
    _rookMovable(col: col, raw: raw, board: board);
    _bishopMovableSquare(col: col, raw: raw, board: board);
  }

  void _rookMovable(
      {required int col, required int raw, required List<List<Square>> board}) {
    for (int i = col; i < board.length - 1; i++) {
      if (board[i + 1][raw].pieace != null) {
        if (board[i + 1][raw].pieace!.type != type) {
          board[i + 1][raw].changeActive();
        }
        break;
      } else {
        board[i + 1][raw].changeActive();
      }
    }
    //?Part 2
    for (int i = col; i > 0; i--) {
      if (board[i - 1][raw].pieace != null) {
        if (board[i - 1][raw].pieace!.type != type) {
          board[i - 1][raw].changeActive();
        }
        break;
      } else {
        board[i - 1][raw].changeActive();
      }
    }

    //?Part 3
    for (int i = raw; i < board.length - 1; i++) {
      if (board[col][i + 1].pieace != null) {
        if (board[col][i + 1].pieace!.type != type) {
          board[col][i + 1].changeActive();
        }
        break;
      } else {
        board[col][i + 1].changeActive();
      }
    }
    //?Part 4
    for (int i = raw; i > 0; i--) {
      if (board[col][i - 1].pieace != null) {
        if (board[col][i - 1].pieace!.type != type) {
          board[col][i - 1].changeActive();
        }
        break;
      } else {
        board[col][i - 1].changeActive();
      }
    }
  }

  void _pawnMovable(
      {required int col, required int raw, required List<List<Square>> board}) {
    if (type.value) {
      board[col - 1][raw].changeActive();
      board[col - 2][raw].changeActive();
    } else {
      board[col + 1][raw].changeActive();
      board[col + 2][raw].changeActive();
    }
  }

  void _bishopMovableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    //?bottomLeft
    int cbottomLeft = col;
    int rbottomLeft = raw;

    while (cbottomLeft < 7 && rbottomLeft > 0) {
      if (board[cbottomLeft + 1][rbottomLeft - 1].pieace == null) {
        board[cbottomLeft + 1][rbottomLeft - 1]
            .changeActive(board: board, col: col, row: raw);
      } else {
        if (board[cbottomLeft + 1][rbottomLeft - 1].pieace!.type != type) {
          board[cbottomLeft + 1][rbottomLeft - 1]
              .changeActive(board: board, col: col, row: raw);
        }
        break;
      }
      cbottomLeft++;
      rbottomLeft--;
    }
    //?Part 2
    int cbottomRight = col;
    int rbottomRight = raw;
    while (cbottomRight < 7 && rbottomRight < 7) {
      if (board[cbottomRight + 1][rbottomRight + 1].pieace == null) {
        board[cbottomRight + 1][rbottomRight + 1]
            .changeActive(board: board, col: col, row: raw);
      } else {
        if (board[cbottomRight + 1][rbottomRight + 1].pieace!.type != type) {
          board[cbottomRight + 1][rbottomRight + 1]
              .changeActive(board: board, col: col, row: raw);
        }
        break;
      }
      cbottomRight++;
      rbottomRight++;
    }
    //?Part 3
    int ctopLeft = col;
    int rtopLeft = raw;
    while (ctopLeft > 0 && rtopLeft > 0) {
      if (board[ctopLeft - 1][rtopLeft - 1].pieace == null) {
        board[ctopLeft - 1][rtopLeft - 1]
            .changeActive(board: board, col: col, row: raw);
      } else {
        if (board[ctopLeft - 1][rtopLeft - 1].pieace!.type != type) {
          board[ctopLeft - 1][rtopLeft - 1]
              .changeActive(board: board, col: col, row: raw);
        }
        break;
      }
      ctopLeft--;
      rtopLeft--;
    }

    //?Part 4
    int ctopRight = col;
    int rtopRight = raw;
    while (ctopRight > 0 && rtopRight < 7) {
      if (board[ctopRight - 1][rtopRight + 1].pieace == null) {
        board[ctopRight - 1][rtopRight + 1]
            .changeActive(board: board, col: col, row: raw);
      } else {
        if (board[ctopRight - 1][rtopRight + 1].pieace!.type != type) {
          board[ctopRight - 1][rtopRight + 1]
              .changeActive(board: board, col: col, row: raw);
        }
        break;
      }
      ctopRight--;
      rtopRight++;
    }
  }

  @override
  String toString() => 'Piece(img: $img)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Piece && other.img == img;
  }

  @override
  int get hashCode => img.hashCode;
}

class Pawn extends Piece {
  Pawn({required super.type}) {
    img =
        type.value ? AssetsPieces.pawnWhite1.url : AssetsPieces.pawnBlack1.url;
  }
  //?Methods
  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    board[col][raw].changeActive();
    _pawnMovable(col: col, raw: raw, board: board);
  }
}

class Knight extends Piece {
  Knight({required super.type}) {
    img = type.value
        ? AssetsPieces.knightWhite1.url
        : AssetsPieces.knightBlack1.url;
  }

  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    board[col][raw].changeActive();
    //?part1
    _knightMovable(col: col, raw: raw, board: board);
  }
}

class Bishop extends Piece {
  Bishop({required super.type}) {
    img = type.value
        ? AssetsPieces.bishopWhite1.url
        : AssetsPieces.bishopBlack1.url;
  }

  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    board[col][raw].changeActive();
    _bishopMovableSquare(col: col, raw: raw, board: board);
  }
}

class Rook extends Piece {
  Rook({required super.type}) {
    img =
        type.value ? AssetsPieces.rookWhite1.url : AssetsPieces.rookBlack1.url;
  }

  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    board[col][raw].changeActive();
    //?Part 1
    _rookMovable(col: col, raw: raw, board: board);
  }
}

class Queen extends Piece {
  Queen({required super.type}) {
    img = type.value
        ? AssetsPieces.queenWhite1.url
        : AssetsPieces.queenBlack1.url;
  }

  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    _queenMovable(col: col, raw: raw, board: board);
  }
}

class King extends Piece {
  King({required super.type}) {
    img =
        type.value ? AssetsPieces.kingWhite1.url : AssetsPieces.kingBlack1.url;
  }

  @override
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board}) {
    board[col][raw].changeActive();
    _kingMovable(col: col, raw: raw, board: board);
  }
}
