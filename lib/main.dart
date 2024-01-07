import 'dart:io';

import 'package:app_v1/handlers/BScan.dart';
import 'package:app_v1/pages/home.dart';
import 'package:flutter/material.dart';



Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage()
    );
  }
}