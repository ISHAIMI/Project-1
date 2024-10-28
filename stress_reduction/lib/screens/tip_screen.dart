import 'package:flutter/material.dart';
import 'package:stress_reduction/constants.dart';

class TipScreen extends StatefulWidget {
  const TipScreen({super.key});

  static const String id = 'tip_screen';

  @override
  State<TipScreen> createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  final List<String> tips = [
    "Take a deep breath and be present in the moment.",
    "Focus on what you can control and let go of what you cannot.",
    "Start your day with gratitude and a calm mind.",
  ];

  String getDailyTip() {
    final now = DateTime.now();
    return tips[now.day % tips.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSixColor,
      appBar: AppBar(title: Text("Daily Mindfulness Tip"),backgroundColor: kPrimaryColor,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            getDailyTip(),
            style: TextStyle(fontSize: 24,color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
