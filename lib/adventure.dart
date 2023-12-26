import 'dart:async';
import 'dart:ui';

import 'package:adventure/components/level.dart';
import 'package:adventure/components/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class Adventure extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks, HasCollisionDetection {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;
  Player player = Player();
  late JoystickComponent joystick;
  bool showJoystik = true;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    final world = Level(
      levelName: 'map1',
      player: player,
    );

    cam = CameraComponent.withFixedResolution(
        world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam..priority = -1, world..priority = -1]);

    if (showJoystik) {
      addJoystick();
      debugMode = true;
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showJoystik) {
      updateJoystick();
    }
    super.update(dt);
  }

  void addJoystick() {
    joystick = JoystickComponent(
      priority: 1,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 32, right: 32),
    );

    add(joystick);
  }

  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void goGame() {
    Get.offAndToNamed('/game');
  }
}
