import 'dart:async';
import 'dart:ui';

import 'package:adventure/controllers/components/hud.dart';
import 'package:adventure/controllers/components/jump_button.dart';
import 'package:adventure/controllers/components/level.dart';
import 'package:adventure/controllers/components/player.dart';
import 'package:adventure/models/player_data.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class Adventure extends FlameGame
    with
        HasKeyboardHandlerComponents,
        DragCallbacks,
        HasCollisionDetection,
        TapCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  final playerData = PlayerData();
  late JoystickComponent joystick;
  bool showJoystik = true;
  bool playSounds = true;
  double soundVolume = 1.0;
  List<String> levelNames = ['map1', 'map1'];
  int currentLevelIndex = 0;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAllImages();

    _loadlevel();

    addJoystick();
    add(JumpButtonController());
    add(Hud(priority: 1));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    updateJoystick();

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
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void loadNextLevel() {
    removeWhere((component) => component is Level);

    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      _loadlevel();
    } else {
      // no more levels
      currentLevelIndex = 0;
      _loadlevel();
    }
  }

  void _loadlevel() {
    Future.delayed(const Duration(seconds: 1), () {
      Level world = Level(
        player: player,
        levelName: levelNames[currentLevelIndex],
      );

      cam = CameraComponent.withFixedResolution(
        world: world,
        width: 640,
        height: 360,
      );
      cam.viewfinder.anchor = Anchor.topLeft;

      addAll([cam..priority = -1, world..priority = -1]);
    });
  }

  void goGame() {
    Get.offAndToNamed('/game');
  }
}
