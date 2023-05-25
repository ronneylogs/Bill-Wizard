import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
// Package for Http.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../main.dart';
import 'models/receipt_model.dart';

class receiptApiServices {
  String endpoint = "http://10.0.2.2:3000/api/loadContent";

  Future<List<ReceiptModel>> getReceipts() async {
    Map req = new Map();
    req = {"email": globalInfo.email};
    // Response response = await get(Uri.parse(endpoint));
    Response response = await http.post(Uri.parse(endpoint), body: req);
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      return result.map(((e) => ReceiptModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// Entry point of shared data
final receiptProvider =
    Provider<receiptApiServices>((ref) => receiptApiServices());
