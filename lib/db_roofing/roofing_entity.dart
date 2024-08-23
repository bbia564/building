import 'package:intl/intl.dart';

class RoofingEntity {
  int id;
  DateTime createTime;
  int type;
  String result;

  RoofingEntity({
    required this.id,
    required this.createTime,
    required this.type,
    required this.result,
  });

  factory RoofingEntity.fromJson(Map<String, dynamic> json) {
    return RoofingEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      type: json['type'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createTime': createTime.toIso8601String(),
      'type': type,
      'result': result,
    };
  }

  String get createTimeStr {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(createTime);
  }
}