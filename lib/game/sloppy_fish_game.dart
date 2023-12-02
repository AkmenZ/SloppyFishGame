import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:sloppy_fish/components/background.dart';
import 'package:sloppy_fish/components/base.dart';
import 'package:sloppy_fish/components/pipe_group.dart';
import 'package:sloppy_fish/components/player.dart';
import 'package:sloppy_fish/game/config.dart';

class SloppyFishGame extends FlameGame with TapDetector {
  late Player player;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Base(),
      player = Player(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

  @override
  void onTap() {
    super.onTap();
    player.swim();
  }
}
