import 'package:flutter/material.dart';
import 'package:tourmate/screens/booking_list.dart';
import 'package:tourmate/screens/home.dart';
import 'package:tourmate/screens/homescreen.dart';
import 'package:tourmate/screens/onboarding_screen.dart';

import 'package:tourmate/theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tour Mate",
      theme: DarkTheme,
      home: HomeScreen(),
    );
  }
}
