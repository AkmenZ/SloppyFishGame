import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

enum PlayerMovement { middle, up, down }

class Player extends SpriteGroupComponent<PlayerMovement>
    with HasGameRef<SloppyFishGame>, CollisionCallbacks {
  Player();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final playerMid = await gameRef.loadSprite(Assets.playerFloat);
    final playerUp = await gameRef.loadSprite(Assets.playerSwim);
    final playerDown = await gameRef.loadSprite(Assets.playerDie);

    size = Vector2(50, 40);
    current = PlayerMovement.middle;
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      PlayerMovement.middle: playerMid,
      PlayerMovement.up: playerUp,
      PlayerMovement.down: playerDown
    };

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.playerVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    current = PlayerMovement.down;
    gameOver();
  }

  void swim() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.3, curve: Curves.decelerate),
        onComplete: () => current = PlayerMovement.middle,
      ),
    );
    FlameAudio.play(Assets.moveSound);
    current = PlayerMovement.up;
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    FlameAudio.play(Assets.dieSound);
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
  }
}
