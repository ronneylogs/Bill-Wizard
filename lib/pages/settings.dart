// This file is for the bill settings page UI.

// Package for general FLutter.
import 'package:flutter/material.dart';

// This class is for settings page.
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Settings"),
      ),
    );
  }
}
