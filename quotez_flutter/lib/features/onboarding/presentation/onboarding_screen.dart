import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotez/features/core/core.dart';
import 'package:quotez/features/home/home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (context) => const BaseScreen(
            title: 'Quotez',
            child: HomeScreen(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: Center(
            child: Stack(
              children: [
                Container(
                  height: 175,
                  width: 175,
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
                SizedBox(
                  height: 175,
                  width: 175,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    color: Colors.brown.shade300,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Quotez',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
