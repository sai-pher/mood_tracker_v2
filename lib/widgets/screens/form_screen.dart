import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/app/labels.dart';
import 'package:mood_tracker_v2/db_handler/handlers/db_handler.dart';
import 'package:mood_tracker_v2/db_handler/models/emotional_state_model.dart';
import 'package:mood_tracker_v2/widgets/components/question_form_feild_widget.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();

}


class _FormScreenState extends State {

  final _formKey = GlobalKey<FormState>();

  static final List<String> categories = ["Food", "Health", "miscellaneous"];
  static final List<String> feelings = ['Sad', 'Irritable', 'Happy', 'Angry', 'Elated', 'Calm', 'Anxious', 'Energetic', 'Restless'];
  static final List<String> upTos = [
    'Work',
    'Class',
    'Assignments',
    'Projects',
    'Meetings',
    'Errands',
    'Chores',
    'Socialisation',
    'Other'
  ];
  static final List<String> sleeps = [
    'Excellent',
    'Great',
    'Good',
    'Bad',
    'Restless'
  ];
  static final List<String> medications = ['Yes', 'No'];
  static final List<String> anxieties = [
    'Extremely',
    'Severely',
    'Mildly',
    'Low'
  ];
  static final List<String> stresses = [
    'Extremely',
    'Severely',
    'Mildly',
    'Low'
  ];
  static final List<String> copings = [
    'Reading',
    'Socialisation',
    'Cooking',
    'Music',
    'Impulse spending',
    'Sex',
    'Alcohol',
    'Isolation',
    'Substance use',
    'Other'
  ];
  static final List<String> productivity = [
    'Productive',
    'Motivated',
    'Focused',
    'Unfocused',
    'Distracted',
    'Unproductive'
  ];
  static final List<String> suicide = [
    'Extremely',
    'Severely',
    'Mildly',
    'Low'
  ];
  static final List<String> harms = ['Extremely', 'Severely', 'Mildly', 'Low'];

  List<bool> answered = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  String _feeling = '';
  String _upto = '';
  String _sleep = '';
  String _medication = '';
  String _anxiety = '';
  String _stress = '';
  String _coping = '';
  String _productivity = '';
  String _suicide = '';
  String _harm = '';

  int currentStep = 0;
  bool complete = false;

  int numQuestions = 10;
  int questionsAnswered = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return formLayout();
  }

  stepperForm(){
    List<Step> steps = [
      Step(
          title: (_feeling != '' && _upto != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
          isActive: currentStep == 0,
          content: Column(
            children: <Widget>[
              QuestionFormField(
                options: feelings,
                question: "How do you feel?",
                selected: _feeling,
                onUpdate: (target) {
                  setState(() {
                    _feeling = target;
                    questionsAnswered += 1;
                    answered[0] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _feeling = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
              QuestionFormField(
                options: upTos,
                question: "What are you up to?",
                selected: _upto,
                onUpdate: (target) {
                  setState(() {
                    _upto = target;
                    questionsAnswered += 1;
                    answered[1] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _upto = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
            ],
          )
      ),
      Step(
          title: (_sleep != '' && _medication != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
          isActive: currentStep == 1,
          content: Column(
            children: <Widget>[
              TextFormField(),
              QuestionFormField(
                options: sleeps,
                question: "How did you sleep?",
                selected: _sleep,
                onUpdate: (target) {
                  setState(() {
                    _sleep = target;
                    questionsAnswered += 1;
                    answered[2] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _sleep = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
              QuestionFormField(
                options: medications,
                question: "Did you take your meds?",
                selected: _medication,
                onUpdate: (target) {
                  setState(() {
                    _medication = target;
                    questionsAnswered += 1;
                    answered[3] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _medication = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
            ],
          )
      ),
      Step(
          title: (_anxiety != '' && _stress != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
          isActive: currentStep == 2,
          content: Column(
            children: <Widget>[
              QuestionFormField(
                options: anxieties,
                question: "How anxious are you?",
                selected: _anxiety,
                onUpdate: (target) {
                  setState(() {
                    _anxiety = target;
                    questionsAnswered += 1;
                    answered[4] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _anxiety = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
              QuestionFormField(
                options: stresses,
                question: "How Stressed are you?",
                selected: _stress,
                onUpdate: (target) {
                  setState(() {
                    _stress = target;
                    questionsAnswered += 1;
                    answered[5] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _stress = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
            ],
          )
      ),
      Step(
        title: (_coping != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
        isActive: currentStep == 3,
        content: Column(
          children: <Widget>[
            QuestionFormField(
              options: copings,
              question: "How are you coping?",
              selected: _coping,
              onUpdate: (target) {
                setState(() {
                  _coping = target;
                  questionsAnswered += 1;
                  answered[6] = true;
                });
              },
              onSaved: (target){
                setState(() {
                  _coping = target!;
                });
              },
              validator: (target){
                if(target == ''){
                  return 'Please select an answer';
                }
                return null;
              },
            ),

          ],
        ),
      ),
      Step(
        title: (_productivity != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
        isActive: currentStep == 4,
        content: Column(
          children: <Widget>[
            QuestionFormField(
              options: productivity,
              question: "How productive are you?",
              selected: _productivity,
              onUpdate: (target) {
                setState(() {
                  _productivity = target;
                  questionsAnswered += 1;
                  answered[7] = true;
                });
              },
              onSaved: (target){
                setState(() {
                  _productivity = target!;
                });
              },
              validator: (target){
                if(target == ''){
                  return 'Please select an answer';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      Step(
          title: (_suicide != '' && _harm != '')?  const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border,color: Colors.red,),
          isActive: currentStep == 5,
          content: Column(
            children: <Widget>[
              QuestionFormField(
                options: suicide,
                question: "Suicidal Ideations?",
                selected: _suicide,
                onUpdate: (target) {
                  setState(() {
                    _suicide = target;
                    questionsAnswered += 1;
                    answered[8] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _suicide = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
              QuestionFormField(
                options: harms,
                question: "Self harm Ideations?",
                selected: _harm,
                onUpdate: (target) {
                  setState(() {
                    _harm = target;
                    questionsAnswered += 1;
                    answered[9] = true;
                  });
                },
                onSaved: (target){
                  setState(() {
                    _harm = target!;
                  });
                },
                validator: (target){
                  if(target == ''){
                    return 'Please select an answer';
                  }
                  return null;
                },
              ),
            ],
          )
      ),
    ];

    _goTo(int newStep){
      setState(() {
        currentStep = newStep;
      });
    }

    next() {
//      _formKey.currentState.save();
      if (currentStep != steps.length - 1) {
        _goTo(currentStep + 1);
      }
      else {
        if (answered.any((test) => test == false)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.blueGrey[900],
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 60.0,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                        "please fill in all the hearts by answering all questions",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )),
                ],
              )));
        }
        else if (_formKey.currentState!.validate()) {
          setState(() {
            _formKey.currentState!.save();
            complete = true;
            var _now = DateTime.now();
            var emotionalState = EmotionalState(
                _feeling,
                _upto,
                _sleep,
                _medication,
                _anxiety,
                _stress,
                _coping,
                _productivity,
                _suicide,
                _harm);
            DBHandler.handler.insert(emotionalState);
          });

          Navigator.pushNamed(context, formCompleteRoute);
        }
      }
    }

    _cancel(){
      if(currentStep > 0){
        _goTo(currentStep - 1);
      }
    }


    return Stepper(
      type: StepperType.horizontal,
      steps: steps,
      currentStep: currentStep,
      onStepContinue: next,
      onStepCancel: _cancel,
      onStepTapped: (step) => _goTo(step),
    );
  }

  formLayout() {
    return Form(
        key: _formKey,
        child: stepperForm()
    );
  }



}

