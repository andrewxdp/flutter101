import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workshop/TrafficLightAnimation/TrafficLightAnimation.dart';
import 'package:workshop/animatedWidget/animatedContainerDemo.dart';
import 'package:workshop/animatedWidget/animatedOpacityDemo.dart';
import 'package:workshop/animatedWidget/animateAlignDemo.dart';

import 'package:workshop/custom_profile_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop/custom_widget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
      ),
      themeMode: _themeMode,
      home: Trafficlightanimation(),
    );
  }
}
