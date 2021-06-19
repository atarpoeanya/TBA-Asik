import 'package:flutter/material.dart';
import 'package:tubes/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turing Machine',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Color(0xFFF1F4FA),
      ),
      home: HomeScreen(),
    );
  }
}