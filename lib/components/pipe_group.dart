import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:sloppy_fish/components/pipe.dart';
import 'package:sloppy_fish/game/assets.dart';
import 'package:sloppy_fish/game/config.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class PipeGroup extends PositionComponent with HasGameRef<SloppyFishGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusBase = gameRef.size.y - Config.baseHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusBase / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusBase - spacing);
    addAll([
      Pipe(height: centerY - spacing / 2, pipePosition: PipePosition.top),
      Pipe(
          height: heightMinusBase - (centerY + spacing / 2),
          pipePosition: PipePosition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -20) {
      removeFromParent(); // remove pipe
      updateScore(); // update score
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    FlameAudio.play(Assets.scoreSound);
    gameRef.player.score += 1;
  }
}
