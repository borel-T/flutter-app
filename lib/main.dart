import 'package:flutter/material.dart';
import 'package:tuto_1/landing.dart';
import "./welcome.dart";
import "./landing.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter fan is fun';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Welcome(),
    );
  }
}
