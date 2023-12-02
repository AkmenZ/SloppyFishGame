import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class Background extends SpriteComponent with HasGameRef<SloppyFishGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
