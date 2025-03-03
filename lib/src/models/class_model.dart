import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:id/src/models/repetetion_rule_model.dart';

class ClassModel extends GetxController {
  final String id;
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
    required this.id,
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
        "id": id,
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
  static ClassModel empty() => ClassModel(
      id: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      className: '',
      teacherId: '',
      location: '',
      repetitionRule: null,
      coTeacherId: null,
      startDateTime: DateTime.now(),
      endDateTime: DateTime.now(),
      oneDayEvent: true);

  factory ClassModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ClassModel(
          id: data['id'],
          className: data['ClassName'],
          teacherId: data['TeacherId'],
          startDateTime:
              (data['StartDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
          endDateTime:
              (data['EndDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
          oneDayEvent: data['OneDayEvent'],
          createdAt:
              (data['CreatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
          updatedAt:
              (data['UpdatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
          repetitionRule: data['RepetitionRule'],
          location: data['Location']);
    } else {
      return ClassModel.empty();
    }
  }
}
