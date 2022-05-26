import 'package:flutter/material.dart';

import '../../models/board.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({Key? key, required this.board}) : super(key: key);
  final Board board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: board.board
            .map((col) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: col
                      .map((raw) => Expanded(
                          child: LayoutBuilder(
                              builder: ((context, constraints) => Container(
                                    padding: const EdgeInsets.all(3),
                                    height: constraints.maxWidth,
                                    color: raw.color,
                                  )))))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
