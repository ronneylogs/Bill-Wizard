// This file is for the bill settings page UI.

// Package for general FLutter.
import 'package:flutter/material.dart';

import '../main.dart';

// This class is for settings page.
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Text(globalInfo.firstName),
            Text(globalInfo.lastName),
          ],
        ),
      ),
    ));
  }
}
