import 'package:cricket_app/detail_page.dart';
import 'package:cricket_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: homePage(),
      routes: {details.route: (context) => details()},
    );
  }
}
