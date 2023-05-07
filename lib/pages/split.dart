// This file is for the bill splitting page UI.

// Package for general Flutter.
import 'package:flutter/material.dart';

// This class is for the bill splitting page.
class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Split"),
      ),
    );
  }
}
