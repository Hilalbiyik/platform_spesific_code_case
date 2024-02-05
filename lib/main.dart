import 'package:flutter/material.dart';
import 'package:platform_cpesific_code_case/methodChannel/batterylevel.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BatterLevel(),
    );
  }
}