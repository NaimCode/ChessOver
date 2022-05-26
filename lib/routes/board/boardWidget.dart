import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/board.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Board>(
        builder: ((context, board, child) => Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: board.board
                    .map((col) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: col
                              .map((square) => PieceWidget(square: square))
                              .toList(),
                        ))
                    .toList(),
              ),
            )));
  }
}

class PieceWidget extends StatelessWidget {
  const PieceWidget({Key? key, required this.square}) : super(key: key);
  final Square square;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: LayoutBuilder(
            builder: ((context, constraints) => Container(
                  padding: const EdgeInsets.all(3),
                  height: constraints.maxWidth,
                  color: square.color,
                  child: Center(
                    child: square.pieace == null
                        ? null
                        : Image.asset(square.pieace!.img),
                  ),
                ))));
  }
}
