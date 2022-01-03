import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/pages/analytics_page.dart';
import 'package:mood_tracker_v2/pages/doctor_page.dart';
import 'package:mood_tracker_v2/pages/form_complete_page.dart';
import 'package:mood_tracker_v2/pages/form_page.dart';
import 'package:mood_tracker_v2/pages/home_page.dart';
import 'package:mood_tracker_v2/pages/intervention_page.dart';

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
        formCompleteRoute: (context) => const FormCompletePage(),
        interventionsRoute: (context) => const InterventionPage(),
        doctorRoute: (context) => const DoctorPage(),
        analyticsRoute: (context) => const AnalyticsPage(),
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

