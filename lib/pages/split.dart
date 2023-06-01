// This file is for the bill splitting page UI.

// Package for general Flutter.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/models/receipt_model.dart';

// This class is for the bill splitting page.
class SplitPage extends ConsumerStatefulWidget {
  SplitPage(this.data);
  ReceiptModel data;

  @override
  _SplitPageState createState() => _SplitPageState();
}

class _SplitPageState extends ConsumerState<SplitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text('Split', style: const TextStyle(color: Colors.black)),
      ), //AppBar
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("SubTotal: \$${widget.data.subTotal}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              )
            ],
          ),
          if (widget.data.tax != "") ...[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tax: \$${widget.data.tax}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                )
              ],
            ),
          ],
          if (widget.data.tip != "") ...[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Tip: \$${widget.data.tip}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                )
              ],
            ),
          ],
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Total: \$${(double.parse(widget.data.subTotal != "" ? widget.data.subTotal : "0") + double.parse(widget.data.tax != "" ? widget.data.tax : "0") + double.parse(widget.data.tip != "" ? widget.data.tip : "0")).toStringAsFixed(2)}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              )
            ],
          ),
          Row(
            children: [
              Text("How many portions would you like to split this bill?"),
            ],
          )
        ],
      )),
    );
  }
}
