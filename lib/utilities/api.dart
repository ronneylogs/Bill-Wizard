// Grab's user information if login success

import 'dart:convert';

// Package for Http.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Package for receipt card
import 'card.dart';

// Loads the receipts
Future<List<Widget>> loadReceipts(String email) async {
  Map req = new Map();
  req = {"email": email};
  var baseUrl = Uri.parse("http://10.0.2.2:3000/api/loadContent");
  var response = await http.post(baseUrl, body: req);
  print(response.body);
  // return null;

  List<dynamic> parsedJson = jsonDecode(response.body);

  List<receiptCard> receiptList = [];

  for (int i = 0; i < parsedJson.length; i++) {
    receiptList.add(
        receiptCard(Image.asset("assets/images/receipt.png"), parsedJson[i]));
  }

  // List<receiptCard> receiptsreceipt = [receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),  receiptCard(Image.asset("assets/images/receipt.png"), "Boston Pizza"),];

  return receiptList;
}

Future<Map<String, dynamic>> loadUserInfo(String email) async {
  Map req = new Map();
  req = {"email": email};
  var baseUrl = Uri.parse("http://10.0.2.2:3000/api/grabUserInfo");
  var response = await http.post(baseUrl, body: req);
  print(response.body);
  // return null;

  Map<String, dynamic> parsedJson = jsonDecode(response.body);

  return parsedJson;
}
