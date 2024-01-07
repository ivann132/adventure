import 'package:adventure/controllers/adventure.dart';
import 'package:adventure/controllers/components/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PauseMenuGame extends StatelessWidget {
  static const id = 'PauseMenu';
  final Adventure gameRef;
  const PauseMenuGame({Key? key, required this.gameRef}) : super(key: key);

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
                  AudioManager.resumeBgm();
                  gameRef.overlays.remove(id);
                  gameRef.resumeEngine();
                },
                child: const Text(
                  'Resume',
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