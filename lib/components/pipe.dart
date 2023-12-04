import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

enum PipePosition { top, bottom }

class Pipe extends SpriteComponent with HasGameRef<SloppyFishGame> {
  Pipe({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipeTop = await Flame.images.load(Assets.pipeTop);
    final pipeBottom = await Flame.images.load(Assets.pipeBottom);

    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeTop);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.baseHeight;
        sprite = Sprite(pipeBottom);
        break;
    }

    add(RectangleHitbox());
  }
}
