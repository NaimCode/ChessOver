import 'package:chess_over/models/board.dart';
import 'package:chess_over/routes/board/boardWidget.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  BoardPage({Key? key}) : super(key: key);
  final Board board = Board();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BoardWidget(board: board)),
    );
  }
}
