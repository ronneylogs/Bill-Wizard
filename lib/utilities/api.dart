// Grab's user information if login success

import 'dart:convert';

// Package for Http.
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> grabUserInfo(String email) async {
  Map req = new Map();
  req = {"email": email};
  var baseUrl = Uri.parse("http://10.0.2.2:3000/api/grabInfo");
  var response = await http.post(baseUrl, body: req);
  print(response.body);
  // return null;

  Map<String, dynamic> parsedJson = jsonDecode(response.body);

  return parsedJson;
}