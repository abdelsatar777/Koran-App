import 'dart:async';

import 'package:flutter/material.dart';
import 'package:koran_app/pages/onboarding_screen.dart';
import 'package:koran_app/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Add a timer that will expire after 3 seconds.
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50,
            left: 2,
            right: 2,
            child: Image.asset("assets/img/star.png"),
          ),
          Positioned(
            top: 300,
            right: 20,
            left: 20,
            child: Image.asset("assets/img/text.png"),
          ),
          Positioned(
            bottom: -1,
            left: 2,
            right: 2,
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Image.asset(
                "assets/img/Frame.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
