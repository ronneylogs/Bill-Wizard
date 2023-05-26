// This file is to store the card widgets.

// Package for general flutter.
import 'package:billwizard/pages/addFriend.dart';
import 'package:billwizard/pages/receipt.dart';
import 'package:billwizard/utilities/data_provider.dart';
import 'package:billwizard/utilities/models/receipt_model.dart';
import 'package:flutter/material.dart';

// Package for other pages.
import 'package:billwizard/pages/addReceipt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/inbox.dart';

// Class for plus card.
class plusCard extends ConsumerWidget {
  const plusCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        // bring user to receipt add page
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => addReceipt()))
            .then((value) {
          ref.refresh(receiptDataProvider);
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 122, 255, 1),
            // border: Border.all(color: Colors.blue.shade200),
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

class addFriendCard extends StatefulWidget {
  const addFriendCard({super.key});

  @override
  State<addFriendCard> createState() => _addFriendCardState();
}

class _addFriendCardState extends State<addFriendCard> {
  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // bring user to friend add page
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => addFriendPage()))
            .then((value) {
          setState(() {
            // refresh state
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange,
            // border: Border.all(color: Colors.blue.shade200),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              child: Text("Add Friends",
                  style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600))),
        ),
      ),
    );
  }
}

// Class for inbox card.
class inboxCard extends StatelessWidget {
  const inboxCard({super.key});

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // bring user to receipt add page
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Inbox();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFCED2CC),
            // border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
              child: Icon(
            Icons.mail,
          )),
        ),
      ),
    );
  }
}

// Class for receipt card.
class receiptCard extends ConsumerWidget {
  receiptCard(this.img, this.receiptInfo);
  Image img;
  ReceiptModel receiptInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => receiptPage(receiptInfo)))
            .then((value) {});
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFDADADA),
          // border: Border.all(color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(children: [
              SizedBox(
                  width: screenWidth * 0.3,
                  child: Image(
                    image: img.image,
                  )),
              Text(receiptInfo.location,
                  style: TextStyle(fontWeight: FontWeight.bold))
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
        margin: const EdgeInsets.only(left: 15.0, right: 15),
        padding: const EdgeInsets.only(left: 3.0, right: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.white,

          //     blurRadius: 4,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ],
        ),

        // color: Colors.grey[],
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: content,
        ));
  }
}
