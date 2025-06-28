import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';

class ItemModel {
  final String txtJapn;
  final String txtEnglish;
  final String img; 
  final String sound;
  final Color color;


  const ItemModel({
    required this.txtJapn,
    required this.txtEnglish,
    required this.img,
    required this.sound,
    required this.color,
    
  });

  playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource(sound));
  }
}
