import 'package:chess_over/data/assets.dart';
import 'package:chess_over/models/enum.dart';

abstract class Piece {
  late String img;
  PieceType type;
  Piece({required this.type});

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
}
