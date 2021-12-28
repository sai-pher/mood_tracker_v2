import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/pages/form_page.dart';
import 'package:mood_tracker_v2/pages/home_page.dart';

import 'app/labels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeRoute: (context) => const HomePage(),
        formRoute: (context) => const FormPage(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

