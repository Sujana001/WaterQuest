import 'package:flutter/material.dart';
import 'package:waterquest_mvp/home.dart';

void main() {
  runApp(WaterQuestMVP());
}

class WaterQuestMVP extends StatelessWidget {
  const WaterQuestMVP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const Home(),
    );
  }
}
