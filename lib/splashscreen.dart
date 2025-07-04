import 'package:flutter/material.dart';
import '/yolo_video.dart'; 
import 'package:flutter_vision/flutter_vision.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late FlutterVision vision;

  @override
  void initState() {
    super.initState();
    initModel();
  }

  Future<void> initModel() async {
    vision = FlutterVision();
    await vision.loadYoloModel( //LOAD MODEL HERE WITH PATHS
        labels: 'assets/labels.txt',
        modelPath: 'assets/best_float32.tflite',
        modelVersion: "yolov8",
        numThreads: 6,
        useGpu: true);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => YoloVideo(vision: vision), 
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash.png', 
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), 
          ],
        ),
      ),
    );
  }
}