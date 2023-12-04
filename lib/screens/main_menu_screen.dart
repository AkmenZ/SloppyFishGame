import 'package:flutter/material.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key, required this.game});

  static const String id = 'mainMenu';
  final SloppyFishGame game;

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.background),
              fit: BoxFit.contain,
            ),
          ),
          child: const Center(
            child: Text('Suka'),
          ),
        ),
      ),
    );
  }
}
