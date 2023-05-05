// Package for general flutter.
import 'package:flutter/material.dart';

// Class for plus card.
class plusCard extends StatelessWidget {
  const plusCard({super.key});

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // bring user to receipt add page
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[200],
            border: Border.all(color: Colors.blue.shade200),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
              child: Icon(
            Icons.add,
          )),
        ),
      ),
    );
  }
}

// Class for receipt card.
class receiptCard extends StatelessWidget {
  receiptCard(this.img, this.title);
  Image img;
  String title;

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigate to the receipt.
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(children: [
              SizedBox(
                  width: screenWidth * 0.3,
                  child: Image(
                    image: img.image,
                  )),
              Text(title)
            ]),
          ),
        ),
      ),
    );
  }
}
