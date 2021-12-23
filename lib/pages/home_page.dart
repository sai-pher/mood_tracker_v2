import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracker_v2/widgets/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }

  homePage(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Moode"),
    ),
    body: const HomeScreen(),
    floatingActionButton: FloatingActionButton(
    elevation: 4,
    onPressed: () {
      Navigator.pushNamed(context, '/form');
//            showDialog(context: context, builder: (context) => ExpenseForm());
    },
    tooltip: "Add new Expense",
    child: const Icon(Icons.edit),
  ),
  );

}