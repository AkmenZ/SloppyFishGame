import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class Base extends ParallaxComponent<SloppyFishGame> {
  @override
  Future<void> onLoad() async {
    final base = await Flame.images.load(Assets.base);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(base, fill: LayerFill.none),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
