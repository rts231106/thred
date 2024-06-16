import 'package:flutter/material.dart';
import 'package:thred/main_navigation/activity/activityscreen.dart';
import 'package:thred/main_navigation/screen/navigationscreen.dart';
import 'package:thred/main_navigation/search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationScreen(),
    );
  }
}
