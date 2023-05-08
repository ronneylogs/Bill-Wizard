// This file for the shared preferences.

// Package for general Flutter.
import 'dart:ffi';

// Package for the shared preferences package.
import 'package:shared_preferences/shared_preferences.dart';

// Class to keep track of the shared preferences.
// Used as an interface for shared preferences.
class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyLogged = "logged in?";

  static const _firstLaunch = "first launch?";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLogged(bool keyLogged) async =>
      await _preferences.setBool(_keyLogged, keyLogged);

  static bool? getLogged() => _preferences.getBool(_keyLogged);

  static Future setFirstLaunched(bool firstLaunch) async =>
      await _preferences.setBool(_firstLaunch, firstLaunch);

  static bool? getFirstLaunched() => _preferences.getBool(_firstLaunch);
}
