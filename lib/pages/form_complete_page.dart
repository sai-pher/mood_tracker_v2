import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/screens/form_complete_screen.dart';

class FormCompletePage extends StatefulWidget{
  const FormCompletePage({Key? key}) : super(key: key);

  @override
  _FormCompletePageState createState() => _FormCompletePageState();
}

class _FormCompletePageState extends State<FormCompletePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Complete'),
      ),
      body: const Center(
        child: FormCompleteScreen()
      ),
    );
  }


}