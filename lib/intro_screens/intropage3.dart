// Package for general flutter packages.
import 'package:flutter/material.dart';

// Package for animations.
import 'package:lottie/lottie.dart';

// Package for gradient usage.
import "../utilities/gradient.dart";

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText(
              'Bill Wizard',
              style: TextStyle(
                  fontSize: screenWidth * 0.18, fontWeight: FontWeight.bold),
              gradient: LinearGradient(colors: [
                Colors.blue.shade400,
                Colors.blue.shade900,
              ]),
            ),
            SizedBox(height: screenWidth * 0.2),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "All in ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.1,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "one",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.1,
                          color: Colors.yellow),
                    ),
                    TextSpan(
                      text: " easy place",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.1,
                          color: Colors.black),
                    )
                  ]),
            ),
            Lottie.asset('assets/animations/receipt_keeping.json'),
            SizedBox(height: screenWidth * 0.3)
          ],
        ),
      ),
    );
  }
}
