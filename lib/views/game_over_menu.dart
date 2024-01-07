import 'package:adventure/controllers/adventure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameOverGame extends StatelessWidget {
  static const id = 'GameOver';
  final Adventure gameRef;
  const GameOverGame({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  gameRef.overlays.remove(id);
                  gameRef.removeAll(gameRef.children);
                  gameRef.resumeEngine();
                  Get.offAndToNamed('/game');
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  Get.offAndToNamed('/menu');
                },
                child: const Text(
                  'Exit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}