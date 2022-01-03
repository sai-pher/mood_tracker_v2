import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/screens/intervention_screen.dart';

class InterventionPage extends StatelessWidget {
  const InterventionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return interventionPage();
  }

  interventionPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interventions'),
      ),
      body: const InterventionScreen(),
    );
  }
}
