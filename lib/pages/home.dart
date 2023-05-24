// This file is for the home page UI.

// Package for general Flutter.
import 'package:billwizard/utilities/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package for the utilities.
import '../utilities/card.dart';

// Package for other screens.
import '../utilities/global.dart';
import '../main.dart';
import '../utilities/models/receipt_model.dart';

List<Widget> test = [
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),
];

// This class is for the home page.
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _receiptData = ref.watch(receiptDataProvider);

    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Receipts",
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const plusCard(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: const inboxCard(),
                ),
              ],
            ),
            Container(
              height: screenHeight * 0.2,
              child: _receiptData.when(
                  data: (_receiptData) {
                    List<ReceiptModel> receiptList =
                        _receiptData.map((e) => e).toList();
                    return Row(
                      children: [
                        Expanded(
                            child: Scrollbar(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: receiptList.length,
                              itemBuilder: (_, index) {
                                return receiptCard(
                                    Image.asset("assets/images/receipt.png"),
                                    receiptList[index].location);
                              }),
                        ))
                      ],
                    );
                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Money to collect",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: screenWidth * 0.075,
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
                    "Money to owe",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: screenWidth * 0.08,
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
                        // color: Colors.white,
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                addFriendCard()
              ],
            )
          ]),
        ),
      ),
    );
  }
}
