import 'package:flutter/material.dart';
import 'splashscreen.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(), // Set the SplashScreen as the home page
    );
  }
}
