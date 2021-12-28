import 'package:flutter/material.dart';

class FormCompleteScreen extends StatefulWidget {
  const FormCompleteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FormCompleteState();

}

class FormCompleteState extends State<FormCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return completeSuccess();
  }

  completeSuccess() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//                SizedBox(height: 200,),
        const Icon(Icons.check_circle, color: Colors.cyan, size: 250.0,),
        const SizedBox(height: 20,),
        const Text("Completed", style: TextStyle(color: Colors.green, fontSize: 40),),
        const SizedBox(height: 20,),
        ButtonTheme(
          height: 60,
          minWidth: 100,
          child: TextButton(
            onPressed: () => Navigator.of(context)
                .popUntil((route) => route.isFirst),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[500]),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
              ))
            ),
            child: const Text(
              'Success!',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
//                SizedBox(height: 200,)

      ],
    );
  }

}