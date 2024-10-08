import 'package:audioplayers/audioplayers.dart';

playSound(AudioPlayer player, String audioPath) {
  player.onPlayerComplete.listen((event) {
    player.play(AssetSource(audioPath), volume: 100);
  });
  player.play(AssetSource(audioPath), volume: 100);
}
