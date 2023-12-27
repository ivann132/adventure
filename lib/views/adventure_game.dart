import 'package:adventure/controllers/adventure.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Adventure_game extends StatelessWidget {
  Adventure_game({Key? key}) : super(key: key);

  final Adventure game = Adventure();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: game),
    );
  }
}