import 'package:id/src/models/repetetion_rule_model.dart';

class ClassModel {
  final String? classId;
  final String className;
  final String teacherId;
  final Map<String, String>? coTeacherId; // Corrected to Map<String, String>
  final String? description;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime startTime;
  final DateTime endTime;
  final RepetionRule repetitionRule;
  final bool oneDayEvent;
  final String? location;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClassModel({
    this.classId,
    required this.className,
    required this.teacherId,
    this.description,
    this.coTeacherId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.repetitionRule,
    required this.oneDayEvent,
    this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  // toJson() => {
  //       "ClassId": classId,
  //       "ClassName": className,
  //       "TeacherId": teacherId,
  //       "CoTeacherId": coTeacherId, // Corrected to Map<String, String>
  //       "StartDate": startDate,
  //       "EndDate": endDate,
  //       "StartTime": startTime,
  //       "EndTime": endTime,
  //       "RepetitionRule": repetitionRule,
  //       "OneDayEvent": oneDayEvent,
  //       "Location": location,
  //       "CreatedAt": createdAt,
  //       "UpdatedAt": updatedAt
  //     };
}
