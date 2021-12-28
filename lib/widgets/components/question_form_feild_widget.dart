import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionFormField extends FormField<String> {

  final List<String> options;
  final String question;
  final String selected;
  final Function(String) onUpdate;

  QuestionFormField({Key? key,
    required this.options,
    required this.question,
    required this.selected,
    required this.onUpdate,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,

}) : super(key: key,
    initialValue: '',
    onSaved: onSaved,
    validator: validator,
    builder: (FormFieldState<String> state) {

      answers() {
        return options.map((option) => TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(selected != option ? Colors.transparent : Colors.cyan),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
                side: const BorderSide(color: Colors.cyan)
            ))
          ),
          child: Text(option, style: const TextStyle(color: Colors.white),),
          onPressed: () {
            state.didChange(option);
            onUpdate(option);
            },
        )).toList();
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: InputDecorator(
          decoration: InputDecoration(
              errorText: state.hasError ? state.errorText : null,
              labelText: question,
              labelStyle: const TextStyle(
                  fontSize: 24,
                  color: Colors.cyan
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
          ),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8.0,
            runSpacing: 8.0,
            children: answers(),
          ),
        ),
      );
  }
  );

}