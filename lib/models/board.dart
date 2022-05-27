import 'dart:collection';

import 'package:chess_over/models/enum.dart';
import 'package:flutter/material.dart';

import 'package:chess_over/models/piece.dart';

class Board extends ChangeNotifier {
  //?Private fields
  final List<int> _y = [8, 7, 6, 5, 4, 3, 2, 1];
  final Color _color1 = const Color(0xffB7C0D8);
  final Color _color2 = const Color(0xffE8EDF9);
  final Color _activeColor = const Color(0xffA796FF);
  final List<String> _x = ["A", "B", "C", "D", "E", "F", "G", "H"];
  final List<List<Square>> _board = [];
  UnmodifiableListView<List<Square>> get board => UnmodifiableListView(_board);
  Board() {
    _init();
    _setPieces();
  }
  //!test
  void addPiece() {
    _board[3][0].pieace = Pawn(type: PieceType.black);
    notifyListeners();

    // _board[7][0].pieace = Rook(type: PieceType.white);
  }

  //?Public methods
  void changeActive(String id) {
    _search(
        id: id,
        eq: (square) {
          if (square.pieace != null) {
            square.changeActive();
            //movableSquare(id);
          }
        },
        neq: (square) {
          square.active = false;
        });
    notifyListeners();
  }

  void movableSquare(String id) {
    _resetActivity();
    _searchMovableSquare(
        id: id,
        eq: (square, i, y) {
          if (square.pieace != null) {
            square.pieace!.movableSquare(col: i, raw: y, board: board);
          } else {
            _resetActivity();
          }
        });
    notifyListeners();
  }

  //?Private methods
  void _resetActivity() {
    for (int i = 0; i < _board.length; i++) {
      for (int y = 0; y < _board[i].length; y++) {
        _board[i][y].active = false;
      }
    }
  }

  void _search(
      {required String id,
      required void Function(Square) eq,
      required void Function(Square) neq}) {
    for (int i = 0; i < _board.length; i++) {
      for (int y = 0; y < _board[i].length; y++) {
        if (_board[i][y].id == id) {
          eq(_board[i][y]);
        } else {
          neq(_board[i][y]);
        }
      }
    }
  }

  void _searchMovableSquare(
      {required String id, required void Function(Square, int, int) eq}) {
    for (int i = 0; i < _board.length; i++) {
      for (int y = 0; y < _board[i].length; y++) {
        if (_board[i][y].id == id) {
          eq(_board[i][y], i, y);
        }
      }
    }
  }

  void _init() {
    for (int col in _y) {
      final List<Square> temp = [];
      for (String raw in _x) {
        final Square square = Square(
            color: _setSquareColor(col: col, raw: raw, raws: _x),
            id: col.toString() + raw,
            activeColor: _activeColor);
        temp.add(square);
      }
      _board.add(temp);
    }
  }

  void _setPieces() {
    for (var i = 0; i < 8; i++) {
      _board[0][i].pieace = King(type: PieceType.black);
    }
    _board[2][1].pieace = King(type: PieceType.black);
    _board[4][4].pieace = King(type: PieceType.black);
    // for (int i = 0; i < _x.length; i++) {
    //   _board[1][i].pieace = Pawn(type: PieceType.black);
    //   _board[6][i].pieace = Pawn(type: PieceType.white);
    // }

    // //?Rook
    // _board[0][0].pieace = Rook(type: PieceType.black);
    // _board[7][0].pieace = Rook(type: PieceType.white);
    // _board[0][7].pieace = Rook(type: PieceType.black);
    // _board[7][7].pieace = Rook(type: PieceType.white);

    // //?Knight
    // _board[0][1].pieace = Knight(type: PieceType.black);
    // _board[0][6].pieace = Knight(type: PieceType.black);
    // _board[7][1].pieace = Knight(type: PieceType.white);
    // _board[7][6].pieace = Knight(type: PieceType.white);

    // //?Bishop
    // _board[0][2].pieace = Bishop(type: PieceType.black);
    // _board[0][5].pieace = Bishop(type: PieceType.black);
    // _board[7][2].pieace = Bishop(type: PieceType.white);
    // _board[7][5].pieace = Bishop(type: PieceType.white);

    // //?Queen
    // _board[0][3].pieace = Queen(type: PieceType.black);
    // _board[7][3].pieace = Queen(type: PieceType.white);

    // //?King
    // _board[0][4].pieace = King(type: PieceType.black);
    // _board[7][4].pieace = King(type: PieceType.white);
  }

  Color _setSquareColor(
      {required int col, required String raw, required List<String> raws}) {
    if (col.isEven) {
      if (raws.indexOf(raw).isOdd) return _color1;
    } else {
      if (raws.indexOf(raw).isEven) return _color1;
    }
    return _color2;
  }

  //?Widget

}

class Square {
  Color color;
  bool active = false;
  Color activeColor;
  Piece? pieace;
  String id;

  Square({
    required this.color,
    this.pieace,
    required this.activeColor,
    required this.id,
  });

  Square copyWith(
      {Color? color, Piece? pieace, String? id, Color? activeColor}) {
    return Square(
      activeColor: activeColor ?? this.activeColor,
      color: color ?? this.color,
      pieace: pieace ?? this.pieace,
      id: id ?? this.id,
    );
  }

  //?Getters
  Color get getColor => active && pieace != null ? activeColor : color;
  //?Methods
  void changeActive() {
    active = !active;
  }
}
