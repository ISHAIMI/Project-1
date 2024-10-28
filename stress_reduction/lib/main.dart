import 'package:flutter/material.dart';
import 'package:stress_reduction/screens/breathing_screen.dart';
import 'package:stress_reduction/screens/home_screen.dart';
import 'package:stress_reduction/screens/meditation_screen.dart';
import 'package:stress_reduction/screens/tip_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness & Stress Reduction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        BreathingScreen.id: (context) => BreathingScreen(),
        MeditationScreen.id: (context) => MeditationScreen(),
        TipScreen.id: (context) => TipScreen(),
      },
    );
  }
}
