import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/data.dart';
import 'package:flutter_walkthrough/on_boarding.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(
        images: imageList,
        titles: titlesList,
        subtitles: subtitlesList,
      ),
    );
  }
}

void main() => runApp(const MyApp());
