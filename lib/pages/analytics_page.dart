import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/screens/analytics_screen.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _analyticsPage();
  }

  _analyticsPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: const AnalyticsScreen(),
    );
  }
}
