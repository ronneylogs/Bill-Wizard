// This file is to store the card widgets.

// Package for general flutter.
import 'package:flutter/material.dart';

// Package for other pages.
import 'package:billwizard/pages/addReceipt.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return addReceipt();
        }));
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

// Class for login card.
class loginCard extends StatelessWidget {
  // const loginCard({super.key});
  loginCard(this.content);
  Container content;

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,

              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),

        // color: Colors.grey[],
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: content,
        ));
  }
}
