import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

enum PlayerMovement { middle, up, down }

class Player extends SpriteGroupComponent<PlayerMovement>
    with HasGameRef<SloppyFishGame> {
  Player();

  @override
  Future<void> onLoad() async {
    final playerMid = await gameRef.loadSprite(Assets.playerMiddle);
    final playerUp = await gameRef.loadSprite(Assets.playerMiddle);
    final playerDown = await gameRef.loadSprite(Assets.playerMiddle);

    size = Vector2(50, 40);
    current = PlayerMovement.middle;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      PlayerMovement.middle: playerMid,
      PlayerMovement.up: playerUp,
      PlayerMovement.down: playerDown
    };
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.playerVelocity * dt;
  }

  void swim() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = PlayerMovement.down,
      ),
    );
    current = PlayerMovement.up;
  }
}
