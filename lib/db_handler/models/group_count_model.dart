import 'package:mood_tracker_v2/app/labels.dart';

class GroupCount {

  String groupName;
  int groupCount;

  GroupCount({required this.groupName, required this.groupCount});

  GroupCount.fromMap(String groupColumnName, Map<String, dynamic> map)
      : groupName = map[groupColumnName],
        groupCount = map[groupColumnCount];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      groupColumnName: groupName,
      groupColumnCount: groupCount,
    };

    return map;
  }
}