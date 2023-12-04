import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloppy_fish/components/background.dart';
import 'package:sloppy_fish/components/base.dart';
import 'package:sloppy_fish/components/base_2.dart';
import 'package:sloppy_fish/components/base_3.dart';
import 'package:sloppy_fish/components/pipe_group.dart';
import 'package:sloppy_fish/components/player.dart';
import 'package:sloppy_fish/game/config.dart';

class SloppyFishGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Player player;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Base3(),
      Base2(),
      Base(),
      player = Player(),
      score = buildScore(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      textRenderer: TextPaint(
          style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 30)),
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${player.score}';
  }

  @override
  void onTap() {
    super.onTap();
    player.swim();
  }
}
