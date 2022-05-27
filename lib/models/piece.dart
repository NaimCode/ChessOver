import 'package:chess_over/data/assets.dart';
import 'package:chess_over/models/board.dart';
import 'package:chess_over/models/enum.dart';

abstract class Piece {
  late String img;
  PieceType type;

  Piece({required this.type});
  void movableSquare(
      {required int col, required int raw, required List<List<Square>> board});
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
    if (type.value) {
      board[col - 1][raw].changeActive();
      board[col - 2][raw].changeActive();
    } else {
      board[col + 1][raw].changeActive();
      board[col + 2][raw].changeActive();
    }
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
    // TODO: implement movableSquare
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
    //?Part 1
    int cbottomLeft = col;
    int rbottomLeft = raw;
    while (cbottomLeft < 7 && rbottomLeft > 0) {
      if (board[cbottomLeft + 1][rbottomLeft - 1].pieace == null) {
        board[cbottomLeft + 1][rbottomLeft - 1].changeActive();
        cbottomLeft++;
        rbottomLeft--;
      } else {
        break;
      }
    }
    //?Part 2
    int cbottomRight = col;
    int rbottomRight = raw;
    while (cbottomRight < 7 && rbottomRight < 7) {
      board[cbottomRight + 1][rbottomRight + 1].changeActive();
      cbottomRight++;
      rbottomRight++;
    }
    //?Part 3
    int ctopLeft = col;
    int rtopLeft = raw;
    while (ctopLeft > 0 && rtopLeft > 0) {
      if (board[ctopLeft - 1][rtopLeft - 1].pieace == null) {
        board[ctopLeft - 1][rtopLeft - 1].changeActive();
        ctopLeft--;
        rtopLeft--;
      } else {
        break;
      }
    }
    //?Part 4
    int ctopRight = col;
    int rtopRight = raw;
    while (ctopRight > 0 && rtopRight < 7) {
      if (board[ctopRight - 1][rtopRight + 1].pieace == null) {
        board[ctopRight - 1][rtopRight + 1].changeActive();
        ctopRight--;
        rtopRight++;
      } else {
        break;
      }
    }
    // while (tempRaw >= 0 && tempCol >= 0) {
    //   board[tempCol + 1][tempRaw + 1].changeActive();
    //   tempCol--;
    //   tempRaw--;
    // }
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
    // TODO: implement movableSquare
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
    // TODO: implement movableSquare
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
    // TODO: implement movableSquare
  }
}
