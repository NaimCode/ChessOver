import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:chess_over/models/piece.dart';

class Board {
  //?Private fields
  final List<int> _y = [8, 7, 6, 5, 4, 3, 2, 1];
  final Color _color1 = const Color(0xffB7C0D8);
  final Color _color2 = const Color(0xffE8EDF9);
  final List<String> _x = ["A", "B", "C", "D", "E", "F", "G", "H"];
  final List<List<Square>> _board = [];
  UnmodifiableListView<List<Square>> get board => UnmodifiableListView(_board);
  Board() {
    _init();
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
