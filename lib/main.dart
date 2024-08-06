import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

void playSound(int noteName) {
  AudioCache.instance = AudioCache(prefix: '');
  final player = AudioPlayer();
  player.play(AssetSource('assets/note$noteName.wav'));
}

Expanded buildKeys({int notenr = 1, Color colorName1 = Colors.red}) {
  return Expanded(
    child: TextButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(colorName1)),
      onPressed: () {
        playSound(notenr);
      },
      child: Text(''),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKeys(notenr: 1, colorName1: Colors.pink),
                buildKeys(notenr: 2, colorName1: Colors.red),
                buildKeys(notenr: 3, colorName1: Colors.blue),
                buildKeys(notenr: 4, colorName1: Colors.purple),
                buildKeys(notenr: 5, colorName1: Colors.blue),
                buildKeys(notenr: 6, colorName1: Colors.green),
                buildKeys(notenr: 7, colorName1: Colors.yellow),
              ],
            ),
          )),
    );
  }
}
