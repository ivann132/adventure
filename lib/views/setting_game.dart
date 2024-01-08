import 'dart:ui';
import 'package:adventure/controllers/adventure.dart';
import 'package:adventure/controllers/components/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsGame extends StatelessWidget {
  static const id = 'SettingsMenu';
  final Adventure? gameRef;
  const SettingsGame({Key? key, this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/Background/background4.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.transparent,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 60),
                          Column(
                            children: [
                              SizedBox(
                                width: 300,
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: AudioManager.bgm,
                                  builder: (context, bgm, child) =>
                                      SwitchListTile(
                                    title: const Text(
                                      'Background Music',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    activeColor: Colors.amber,
                                    value: bgm,
                                    onChanged: (value) =>
                                        AudioManager.bgm.value = value,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: AudioManager.sfx,
                                  builder: (context, sfx, child) =>
                                      SwitchListTile(
                                    title: const Text(
                                      'Sound Effects',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    activeColor: Colors.amber,
                                    value: sfx,
                                    onChanged: (value) =>
                                        AudioManager.sfx.value = value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}