import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/home_page.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

