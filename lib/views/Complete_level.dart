import 'package:adventure/controllers/adventure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteGame extends StatelessWidget {
  static const id = 'Complete';
  final Adventure gameRef;
  const CompleteGame({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Complete All level',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
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
                  'Play again',
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
                  'Menu',
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
