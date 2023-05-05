// Package for general flutter packages.
import 'package:flutter/material.dart';

// Package for animations.
import 'package:lottie/lottie.dart';

// Class for the intro page 1.
class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/receipt.json'),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Get your receipts ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.07,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'recorded',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.07,
                          color: Colors.blue[200]),
                    ),
                  ],
                )),
            SizedBox(height: screenWidth * 0.3)
          ],
        ),
      ),
    );
  }
}
