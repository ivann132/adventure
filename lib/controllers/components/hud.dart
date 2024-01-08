import 'dart:async';

import 'package:adventure/controllers/adventure.dart';
import 'package:adventure/controllers/components/audio_manager.dart';
import 'package:adventure/views/game_over_menu.dart';
import 'package:adventure/views/pause_menu.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

class Hud extends Component with HasGameRef<Adventure> {
  PositionType? positionType;
  late final TextComponent collectComponent;
  late final TextComponent healthComponent;

  Hud({super.children, super.priority}) {
    positionType = PositionType.viewport;
  }

  @override
  FutureOr<void> onLoad() {
    collectComponent = TextComponent(
      text: 'Collect: 0',
      position: Vector2(80, 10),
    );
    add(collectComponent);

    healthComponent = TextComponent(
      text: 'x5',
      position: Vector2(700, 10),
    );
    add(healthComponent);

    gameRef.playerData.collect.addListener(onCollectChange);

    final pauseButton = SpriteButtonComponent(
      onPressed: () {
        AudioManager.playSfx('ui_pause.wav', 30.0);
        AudioManager.pauseBgm();
        gameRef.pauseEngine();
        gameRef.overlays.add(PauseMenuGame.id);
      },
      button: Sprite(
        gameRef.images.fromCache('HUD/pause.png'),
      ),
      size: Vector2.all(32),
      position: Vector2(gameRef.size.x / 2, 10),
      anchor: Anchor.topCenter,
    );
    add(pauseButton);

    final healthIndicator = SpriteComponent.fromImage(
      gameRef.images.fromCache('HUD/health.png'),
      size: Vector2.all(40),
      position: Vector2(
        healthComponent.position.x - healthComponent.size.x - 10,
        5,
      ),
    );
    add(healthIndicator);

    gameRef.playerData.health.addListener(onHealthChange);

    return super.onLoad();
  }

  void onCollectChange() {
    collectComponent.text = 'Collect: ${gameRef.playerData.collect.value}';
  }

  void onHealthChange() {
    healthComponent.text = 'x${gameRef.playerData.health.value}';

    if (gameRef.playerData.health.value == 0) {
      AudioManager.stopBgm();
      gameRef.pauseEngine();
      gameRef.overlays.add(GameOverGame.id);
    }
  }
}
