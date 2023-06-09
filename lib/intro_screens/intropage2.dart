// This file is for the intro page 2 UI.

// Package for general Flutter.
import 'package:flutter/material.dart';

// Package for Lottie animations.
import 'package:lottie/lottie.dart';

// Class for the intro page 2.
class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

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
            Lottie.asset('assets/animations/pizza.json'),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Make sure Jimmy ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.07,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "pays",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.07,
                          color: Colors.green),
                    ),
                    TextSpan(
                      text: " you back for pizza last night",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.07,
                          color: Colors.black),
                    )
                  ]),
            ),
            SizedBox(height: screenWidth * 0.3),
          ],
        ),
      ),
    );
  }
}
