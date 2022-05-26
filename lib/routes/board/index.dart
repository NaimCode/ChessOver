import 'package:chess_over/models/board.dart';
import 'package:chess_over/routes/board/boardWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoardPage extends StatelessWidget {
  BoardPage({Key? key}) : super(key: key);
  final Board board = Board();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Board>(
        create: (_) => board,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              board.addPiece();
            },
            child: const Icon(Icons.add),
          ),
          body: const Center(child: BoardWidget()),
        ));
  }
}
