import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../constants.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  static const String id = 'meditation_screen';

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playMeditation(String path) async {
    try {
      // Attempt to play the audio from the specified path
      await _audioPlayer.play(AssetSource(path));
    } catch (e) {
      print("Error playing meditation: $e");
    }
  }

  void stopMeditation() {
    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSixColor,
      appBar: AppBar(title: Text("Guided Meditation"),backgroundColor: kPrimaryColor,),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              playMeditation('meditation_3min.mp3');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Play 3-Minute Meditation",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        SizedBox(height: 70.0),
          ElevatedButton(
            onPressed: () {
              playMeditation('meditation_5min.mp3');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Play 5-Minute Meditation",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 150.0),
          ElevatedButton(
            onPressed: () {
              stopMeditation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Stop",
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
