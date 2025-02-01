import 'package:get/get.dart';
import 'package:id/src/models/repetetion_rule_model.dart';

class ClassModel extends GetxController {
  final String className;
  final String teacherId;
  final List<String>? coTeacherId; // Corrected to Map<String, String>
  final String? description;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final RepetionRule? repetitionRule;
  final bool oneDayEvent;
  final String? location;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassModel({
    required this.className,
    required this.teacherId,
    this.description,
    this.coTeacherId,
    required this.startDateTime,
    required this.endDateTime,
    this.repetitionRule,
    required this.oneDayEvent,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  toJson() => {
        "ClassName": className,
        "TeacherId": teacherId,
        "CoTeacherId": coTeacherId, // Corrected to Map<String, String>
        "StartDate": startDateTime,
        "EndDate": endDateTime,
        "RepetitionRule": repetitionRule,
        "OneDayEvent": oneDayEvent,
        "Location": location,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt
      };
}
