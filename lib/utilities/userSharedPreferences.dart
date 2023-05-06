import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyLogged = "logged in?";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLogged(bool keyLogged) async =>
      await _preferences.setBool(_keyLogged, keyLogged);

  static bool? getLogged() => _preferences.getBool(_keyLogged);
}
