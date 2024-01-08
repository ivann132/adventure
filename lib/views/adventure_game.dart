import 'package:adventure/controllers/adventure.dart';
import 'package:adventure/views/Complete_level.dart';
import 'package:adventure/views/game_over_menu.dart';
import 'package:adventure/views/pause_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Adventure_game extends StatelessWidget {
  Adventure_game({Key? key}) : super(key: key);

  final Adventure game = Adventure();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<Adventure>(
        game: game,
        overlayBuilderMap: {
          PauseMenuGame.id: (context, game) => PauseMenuGame(gameRef: game),
          GameOverGame.id: (context, game) => GameOverGame(gameRef: game),
          CompleteGame.id: (context, game) => CompleteGame(gameRef: game)
        },
      ),
    );
  }
}