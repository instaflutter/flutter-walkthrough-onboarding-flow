import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/on_boarding.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

void main() => runApp(MyApp());
