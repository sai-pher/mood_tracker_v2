import 'package:flutter/cupertino.dart';

class InterventionScreen extends StatefulWidget {
  const InterventionScreen({Key? key}) : super(key: key);

  @override
  _InterventionScreenState createState() => _InterventionScreenState();
}

class _InterventionScreenState extends State<InterventionScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _interventionScreen();
  }

  _interventionScreen() {
    return const Text(
      'Interventions...',
      style: TextStyle(fontSize: 24),
    );
  }
}
