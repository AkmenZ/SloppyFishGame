import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class Base extends ParallaxComponent<SloppyFishGame>
    with HasGameRef<SloppyFishGame> {
  @override
  Future<void> onLoad() async {
    final base = await Flame.images.load(Assets.base);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(base, fill: LayerFill.none),
      ),
    ]);

    add(
      RectangleHitbox(
        position: Vector2(0, gameRef.size.y - Config.baseHeight),
        size: Vector2(gameRef.size.x, Config.baseHeight),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
