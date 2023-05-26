import 'package:billwizard/utilities/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/data_provider.dart';
import '../utilities/models/receipt_model.dart';

class receiptPage extends ConsumerWidget {
  receiptPage(this.data);
  ReceiptModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('${data.location}',
            style: const TextStyle(color: Colors.black)),
      ), //AppBar
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                data.image != null
                    ? Text("${data.image}")
                    : const Text("No image provided"),
              ],
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 122, 255, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data.location != ""
                              ? Text(
                                  "Location: ${data.location}",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )
                              : const Text("Location: None Provided",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                          data.subTotal != ""
                              ? Text("Subtotal: ${data.subTotal}",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white))
                              : const Text("Subtotal: None Provided",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                          data.tax != ""
                              ? Text("Tax: ${data.tax}",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white))
                              : const Text("Tax: None Provided",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                          data.tip != ""
                              ? Text(
                                  "Tip: ${data.tip}",
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.white),
                                )
                              : const Text("Tip: None Provided",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
            const Spacer(flex: 4),
          ],
        )),
      ),
    );
  }
}
