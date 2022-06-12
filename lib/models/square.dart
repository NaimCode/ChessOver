import 'package:chess_over/models/piece.dart';
import 'package:flutter/material.dart';

class Square {
  Color color;
  bool active = false;
  Color activeColor;
  Piece? activePiece;
  Piece? pieace;
  String id;
  List<List<Square>>? _board;
  int? col;
  int? raw;
  Square({
    required this.color,
    this.pieace,
    this.activePiece,
    required this.activeColor,
    required this.id,
  });

  Square copyWith(
      {Color? color,
      Piece? pieace,
      String? id,
      Color? activeColor,
      Piece? activePiece}) {
    return Square(
      activeColor: activeColor ?? this.activeColor,
      color: color ?? this.color,
      pieace: pieace ?? this.pieace,
      activePiece: activePiece ?? this.activePiece,
      id: id ?? this.id,
    );
  }

  //?Getters
  // Color get getColor => active && pieace != null ? activeColor : color;

  Color getColor() {
    return active && pieace != null ? activeColor : color;
  }

  //?Methods
  void changeActive({List<List<Square>>? board, int? col, int? row}) {
    _board = board;
    this.col = col;
    raw = row;
    activePiece = board?[col!][raw!].pieace;

    active = !active;
  }

  void setActive() {
    active = true;
  }

  void moveTo() {
    print("moveTo");
    if (activePiece != null && _board != null) {
      pieace = activePiece;
      _board![col!][raw!].pieace = null;
      //s.pieace = null;
    }
  }

  void reset() {
    active = false;
    // activePiece = null;
    // col = null;
    // raw = null;
  }
}
