import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen1(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'VOX',
              style: TextStyle(
                color: Colors.white,
                fontSize: 52,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Your Voice of News',
              style: TextStyle(
                color: Color(0xFF5CC8E8),
                fontSize: 18,
              ),
            ),

          ],
        ),
      ),
    );
  }
}