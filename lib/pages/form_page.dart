import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_tracker_v2/widgets/screens/form_screen.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();

}

class _FormPageState extends State<FormPage> {

  _formPage() => Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: const FormScreen()
  );

  @override
  Widget build(BuildContext context) {
    return _formPage();
  }
}



