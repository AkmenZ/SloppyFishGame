import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloppy_fish/game/sloppy_fish_game.dart';

class GameOverScreeen extends StatelessWidget {
  const GameOverScreeen({super.key, required this.game});

  static const String id = 'gameOver';
  final SloppyFishGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Game Over',
            style: GoogleFonts.pressStart2p(fontSize: 40, color: Colors.amber),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Score: ${game.player.score}',
            style: GoogleFonts.pressStart2p(fontSize: 36, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              onRestart();
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.deepOrangeAccent),
            child: Text(
              'Play Again',
              style:
                  GoogleFonts.pressStart2p(fontSize: 20, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }

  void onRestart() {
    game.player.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
