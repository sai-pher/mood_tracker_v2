import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/app/labels.dart';
import 'package:mood_tracker_v2/widgets/components/pie_chart_widget.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return analyticsScreen();
  }

  pieChartBuilder(String group, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 24, color: Colors.cyan),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        child: PieChartWidget(grouping: group),
      ),
    );
  }

  analyticsScreen() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: ListView(
          children: <Widget>[
            pieChartBuilder(columnFeeling, "feelings"),
            pieChartBuilder(columnUpTo, 'Up To'),
            pieChartBuilder(columnSleep, 'Sleep'),
            pieChartBuilder(columnMedication, 'Medication'),
            pieChartBuilder(columnAnxiety, 'Anxiety'),
            pieChartBuilder(columnStress, 'Stress'),
            pieChartBuilder(columnCoping, 'Coping'),
            pieChartBuilder(columnProductivity, 'Productivity'),
            pieChartBuilder(columnSuicide, 'Suicide'),
            pieChartBuilder(columnHarm, 'Harm'),
          ],
        ),
      ),
    );
  }
}
