import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

final game = SloppyFishGame();
void main() {
  runApp(
    GameWidget(game: game),
  );
}
