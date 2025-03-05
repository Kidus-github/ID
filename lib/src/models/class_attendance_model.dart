import 'package:cloud_firestore/cloud_firestore.dart';

class ClassAttendanceModel {
  final String attendanceId;
  final String classId;
  final String studentId;
  // final DateTime sessionDate;
  final bool isPresent;
  final String markedBy;
  final DateTime markedAt;

  ClassAttendanceModel(
      {required this.attendanceId,
      required this.classId,
      required this.isPresent,
      required this.markedAt,
      required this.markedBy,
      required this.studentId});

  toJson() {
    return {
      "AttendanceId": attendanceId,
      "ClassId": classId,
      "IsPresent": isPresent,
      "MarkedAt": markedAt,
      "MarkedBy": markedBy,
      "StudntId": studentId
    };
  }

  static ClassAttendanceModel empty() => ClassAttendanceModel(
        attendanceId: '',
        classId: '',
        isPresent: false,
        markedAt: DateTime.now(),
        markedBy: '',
        studentId: '',
      );

  factory ClassAttendanceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return ClassAttendanceModel(
        attendanceId: document.id,
        classId: data['ClassId'] ?? '',
        isPresent: false,
        markedAt: (data['MarkedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        markedBy: data['MarkedBy'] ?? '',
        studentId: data['StudentId'] ?? '',
      );
    } else {
      return ClassAttendanceModel.empty();
    }
  }
}
