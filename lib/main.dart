import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';
import 'package:sloppy_fish/screens/game_over_screen.dart';
import 'package:sloppy_fish/screens/main_menu_screen.dart';

final game = SloppyFishGame();
void main() {
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreeen(game: game),
      },
    ),
  );
}
