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

  static const _rememberUser = "remember user?";

  static const _username = "username";

  static const _password = "password";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setLogged(bool keyLogged) async =>
      await _preferences.setBool(_keyLogged, keyLogged);

  static bool? getLogged() => _preferences.getBool(_keyLogged);

  static Future setFirstLaunched(bool firstLaunch) async =>
      await _preferences.setBool(_firstLaunch, firstLaunch);

  static bool? getFirstLaunched() => _preferences.getBool(_firstLaunch);

  static Future setRememberUser(bool rememberUser) async =>
      await _preferences.setBool(_rememberUser, rememberUser);

  static bool? getRememberUser() => _preferences.getBool(_rememberUser);

  static Future setRememberUsername(String username) async =>
      await _preferences.setString(_username, username);

  static String? getRememberUsername() => _preferences.getString(_username);

  static Future setRememberPassword(String password) async =>
      await _preferences.setString(_password, password);

  static String? getRememberPassword() => _preferences.getString(_password);
}
