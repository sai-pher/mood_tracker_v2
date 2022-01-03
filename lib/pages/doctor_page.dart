import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/screens/doctor_screen.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return doctorPage();
  }

  doctorPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor'),
      ),
      body: const DoctorScreen(),
    );
  }
}
