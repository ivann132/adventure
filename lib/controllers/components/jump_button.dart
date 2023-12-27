import 'dart:async';

import 'package:adventure/controllers/adventure.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

class JumpButtonController extends SpriteComponent
    with HasGameRef<Adventure>, TapCallbacks {
  JumpButtonController();

  final margin = 120;
  final btnSize = 36;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('HUD/jumpbutton.png'));
    position = Vector2(
      game.size.x - margin - btnSize,
      game.size.y - margin - btnSize,
    );
    priority = 10;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.hasJumped = true;
    super.onTapDown(event);
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.hasJumped = false;
    super.onTapUp(event);
  }
}