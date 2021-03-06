import 'package:mood_tracker_v2/app/labels.dart';

class EmotionalState {
  int? _id;
  String? feeling;
  String? upTo;
  String? sleep;
  String? medication;
  String? anxiety;
  String? stress;
  String? coping;
  String? productivity;
  String? suicide;
  String? harm;

  DateTime? _date;

  // ================= Constructors =================

  EmotionalState(
       this.feeling,
       this.upTo,
       this.sleep,
       this.medication,
       this.anxiety,
       this.stress,
       this.coping,
       this.productivity,
       this.suicide,
       this.harm,
      this._date);

  EmotionalState.fromMap(Map<String, dynamic> map) {
    _id = map[columnID];
    feeling = map[columnFeeling];
    upTo = map[columnUpTo];
    sleep = map[columnSleep];
    medication = map[columnMedication];
    anxiety = map[columnAnxiety];
    stress = map[columnStress];
    coping = map[columnCoping];
    productivity = map[columnProductivity];
    suicide = map[columnSuicide];
    harm = map[columnHarm];
    dateMilli = map[columnDate];
  }

  // ================= Helper methods =================

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnFeeling: feeling,
      columnUpTo: upTo,
      columnSleep: sleep,
      columnMedication: medication,
      columnAnxiety: anxiety,
      columnStress: stress,
      columnCoping: coping,
      columnProductivity: productivity,
      columnSuicide: suicide,
      columnHarm: harm,
      columnDate: dateMilli
    };

    if (_id != null) {
      map[columnID] = _id;
    }


    return map;
  }

// ================= Getters and setters =================

// ignore: unnecessary_getters_setters
DateTime get date => _date!;

int get dateMilli => _date!.millisecondsSinceEpoch;

// ignore: unnecessary_getters_setters
set date(DateTime value) {
  _date = value;
}

/// Sets `_date` value to DateTime object from [milliseconds] since epoch.
set dateMilli(int milliseconds) {
  _date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

}
