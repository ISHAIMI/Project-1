import 'package:flutter/material.dart';
import 'dart:async';

import '../constants.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  static const String id = 'breathing_screen';

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  String phase = "Let's Start"; // Phases: Inhale, Hold, Exhale, Hold
  final int duration = 4; // Duration for inhale/hold/exhale in seconds
  late Timer _timer;
  int phaseIndex = 0; // Index to track the current phase
  double size = 100; // Default size

  void _startBreathingCycle() {
    _timer = Timer.periodic(Duration(seconds: duration), (timer) {
      setState(() {
        phaseIndex = (phaseIndex + 1) % 3; // Cycle through phases (0-2)
        phase = _getPhase(phaseIndex);
      });
    });
  }

  String _getPhase(int index) {
    switch (index) {
      case 0:
        return "Inhale"; // Phase 0
      case 1:
        return "Hold"; // Phase 1
      case 2:
        return "Exhale"; // Phase 2
      default:
        return "Inhale"; // Default case, should not occur
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine size based on phase
    if (phase == "Inhale") {
      size = 200; // Expand during inhale
    } else if (phase == "Hold") {
      size = 200; // Hold at max size during both holds
    } else if (phase == "Exhale") {
      size = 100; // Contract during exhale
    }

    return Scaffold(
      backgroundColor: kSixColor,
      appBar: AppBar(
        title: Text("Breathing Exercise"),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            phase,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          AnimatedContainer(
            duration: Duration(seconds: duration), // Smooth transition
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: kSecondColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 70.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                size = 100;
                phaseIndex = 0;
                phase = 'Inhale';
                _startBreathingCycle();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "Start",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
