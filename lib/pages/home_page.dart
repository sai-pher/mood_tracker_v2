import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/components/drawer_widget.dart';
import 'package:mood_tracker_v2/widgets/components/nav_bar_widget.dart';
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
    drawer: const DrawerWidget(),
    body: const HomeScreen(),
    bottomNavigationBar: const NavBar(),
    floatingActionButton: FloatingActionButton(
    elevation: 4,
    onPressed: () {
      Navigator.pushNamed(context, '/form');
//            showDialog(context: context, builder: (context) => ExpenseForm());
    },
    tooltip: "Add new Expense",
    child: const Icon(Icons.edit),
  ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

  );

}