import 'package:flame/components.dart';

class CollisionBlock extends PositionComponent {
  bool isPlatform;
  bool isVoid;

  CollisionBlock({
    position,
    size,
    this.isPlatform = false,
    this.isVoid = false,
  }) : super(
          position: position,
          size: size,
        ) {
    // debugMode = true;
  }
}
