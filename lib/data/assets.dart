enum Assets {
  homeBackground("assets/chessBackground.png");

  const Assets(this.url);
  final String url;
}

enum AssetsPieces {
  //Black
  //v1
  pawnBlack1("assets/pieces/v1/black/pawn.png"),
  bishopBlack1("assets/pieces/v1/black/bishop.png"),
  knightBlack1("assets/pieces/v1/black/knight.png"),
  kingBlack1("assets/pieces/v1/black/king.png"),
  queenBlack1("assets/pieces/v1/black/queen.png"),
  rookBlack1("assets/pieces/v1/black/rook.png"),
  //v2
  pawnBlack2("assets/pieces/v2/black/pawn.png"),
  bishopBlack2("assets/pieces/v2/black/bishop.png"),
  knightBlack2("assets/pieces/v2/black/knight.png"),
  kingBlack2("assets/pieces/v2/black/king.png"),
  queenBlack2("assets/pieces/v2/black/queen.png"),
  rookBlack2("assets/pieces/v2/black/rook.png"),
  //White
  // v1
  pawnWhite1("assets/pieces/v1/white/pawn.png"),
  bishopWhite1("assets/pieces/v1/white/bishop.png"),
  knightWhite1("assets/pieces/v1/white/knight.png"),
  kingWhite1("assets/pieces/v1/white/king.png"),
  queenWhite1("assets/pieces/v1/white/queen.png"),
  rookWhite1("assets/pieces/v1/white/rook.png"),
  // v2
  pawnWhite2("assets/pieces/v2/white/pawn.png"),
  bishopWhite2("assets/pieces/v2/white/bishop.png"),
  knightWhite2("assets/pieces/v2/white/knight.png"),
  kingWhite2("assets/pieces/v2/white/king.png"),
  queenWhite2("assets/pieces/v2/white/queen.png"),
  rookWhite2("assets/pieces/v2/white/rook.png");

  const AssetsPieces(this.url);
  final String url;
}
