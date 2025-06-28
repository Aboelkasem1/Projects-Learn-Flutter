import 'package:audioplayers/audioplayers.dart';

class ItemModel {
  final String txtJapn;
  final String txtEnglish;
  final String img; 
  final String sound;

  const ItemModel({
    required this.txtJapn,
    required this.txtEnglish,
    required this.img,
    required this.sound,
  });

  playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource(sound));
  }
}
