import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/app/labels.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Interventions'),
            onTap: () => Navigator.pushNamed(context, interventionsRoute),
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text('Analytics'),
            onTap: () => Navigator.pushNamed(context, analyticsRoute),
          ),
          ListTile(
            leading: const Icon(Icons.local_hospital),
            title: const Text('Doctor'),
            onTap: () => Navigator.pushNamed(context, doctorRoute),
          ),
        ],
      ),
    );
  }
}
