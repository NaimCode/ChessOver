import 'dart:collection';

import 'package:chess_over/models/enum.dart';
import 'package:flutter/material.dart';

import 'package:chess_over/models/piece.dart';

class Board extends ChangeNotifier {
  //?Private fields
  final List<int> _y = [8, 7, 6, 5, 4, 3, 2, 1];
  final Color _color1 = const Color(0xffB7C0D8);
  final Color _color2 = const Color(0xffE8EDF9);
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

  //?Private functions
  void _init() {
    for (int col in _y) {
      final List<Square> temp = [];
      for (String raw in _x) {
        final Square square = Square(
            color: _setSquareColor(col: col, raw: raw, raws: _x),
            id: col.toString() + raw);
        temp.add(square);
      }
      _board.add(temp);
    }
  }

  void _setPieces() {
    for (int i = 0; i < _x.length; i++) {
      _board[1][i].pieace = Pawn(type: PieceType.black);
      _board[6][i].pieace = Pawn(type: PieceType.white);
    }

    //?Rook
    _board[0][0].pieace = Rook(type: PieceType.black);
    _board[7][0].pieace = Rook(type: PieceType.white);
    _board[0][7].pieace = Rook(type: PieceType.black);
    _board[7][7].pieace = Rook(type: PieceType.white);

    //?Knight
    _board[0][1].pieace = Knight(type: PieceType.black);
    _board[0][6].pieace = Knight(type: PieceType.black);
    _board[7][1].pieace = Knight(type: PieceType.white);
    _board[7][6].pieace = Knight(type: PieceType.white);

    //?Bishop
    _board[0][2].pieace = Bishop(type: PieceType.black);
    _board[0][5].pieace = Bishop(type: PieceType.black);
    _board[7][2].pieace = Bishop(type: PieceType.white);
    _board[7][5].pieace = Bishop(type: PieceType.white);

    //?Queen
    _board[0][3].pieace = Queen(type: PieceType.black);
    _board[7][3].pieace = Queen(type: PieceType.white);

    //?King
    _board[0][4].pieace = King(type: PieceType.black);
    _board[7][4].pieace = King(type: PieceType.white);
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
  Piece? pieace;
  String id;
  Square({
    required this.color,
    this.pieace,
    required this.id,
  });

  Square copyWith({
    Color? color,
    Piece? pieace,
    String? id,
  }) {
    return Square(
      color: color ?? this.color,
      pieace: pieace ?? this.pieace,
      id: id ?? this.id,
    );
  }
}
