import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return _homeScreen();
  }

  contentBuilder(String label, Widget content){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 24, color: Colors.cyan),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        child: content,
      ),
    );
  }

  _homeScreen() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          const Icon(
            Icons.accessibility_new,
            size: 150,
          ),
          const Text(
            'Hey there',
            textScaleFactor: 1.5,
          ),
          contentBuilder("Goals", const Text("Goals set by users will show up here")),
          contentBuilder("Exercises", const Text("Users can see and access their exercises suggestions from here")),
          contentBuilder("Helpful Tips", const Text("Users will be able to see tips tailored to their specific needs here")),
          contentBuilder("Clinic Map", const Text("Users will be able to view clinics near them from here")),
        ],
      ),
    );
  }

}