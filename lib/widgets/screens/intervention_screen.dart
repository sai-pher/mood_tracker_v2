import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/widgets/components/card_button_widget.dart';

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

  interventionsLayout(){
    return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20),
          children: [
            interventionCardBuilder('meditation', Icons.self_improvement),
            interventionCardBuilder('meditation', Icons.self_improvement),
            interventionCardBuilder('meditation', Icons.self_improvement),
            interventionCardBuilder('meditation', Icons.self_improvement),
            interventionCardBuilder('meditation', Icons.self_improvement),
            interventionCardBuilder('meditation', Icons.self_improvement),
          ],
        )
    );
  }

  CardButton interventionCardBuilder(String name, IconData icon) {
    return CardButton(name: name, icon: icon,);
  }

  _interventionScreen() {
    return Column(
      children: [interventionsLayout()],
    );
  }
}
