// This file is for the home page UI.

// Package for general Flutter.
import 'package:flutter/material.dart';

// Package for the utilities.
import '../utilities/card.dart';

// This class is for the home page.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: [
                Column(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Receipts",
                    style: TextStyle(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                plusCard()
              ],
            ),
            Container(
              height: screenHeight * 0.2,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                receiptCard(
                    Image.asset("assets/images/receipt.png"), "Boston Pizza"),
                receiptCard(
                    Image.asset("assets/images/receipt.png"), "Boston Pizza"),
                receiptCard(
                    Image.asset("assets/images/receipt.png"), "Boston Pizza"),
              ]),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Money to collect",
                    style: TextStyle(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Friends",
                    style: TextStyle(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
