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
    //80% of screen width
    double c_width = MediaQuery.of(context).size.width * 0.8;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                receiptPageBox(c_width),
                // const Spacer(flex: 3),
              ],
            ),
            // const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 122, 255, 1),
                      ),
                      onPressed: () {},
                      child: Text("Split this bill")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: Text("Remove")),
                ],
              ),
            ),

            Spacer(),
          ],
        )),
      ),
    );
  }

// Receipt Box
  Container receiptPageBox(double c_width) {
    return Container(
      width: c_width,
      decoration: BoxDecoration(
          color: Colors.grey[700], borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            data.location != ""
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Location: ${data.location}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Location: None Provided",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
            data.subTotal != ""
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Subtotal: ${data.subTotal}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Subtotal: None Provided",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
            data.tax != ""
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tax: ${data.tax}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Tax: None Provided",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
            data.tip != ""
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tip: ${data.tip}",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Tip: None Provided",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
          ],
        ),
      ),
    );
  }
}
