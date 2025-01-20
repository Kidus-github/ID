class ClassAttendanceModel {
  final String? attendanceId;
  final String classId;
  final String userId;
  final DateTime sessionDate;
  final bool isPresent;
  final String markedBy;
  final String markedAt;

  ClassAttendanceModel(
      {this.attendanceId,
      required this.classId,
      required this.isPresent,
      required this.markedAt,
      required this.markedBy,
      required this.sessionDate,
      required this.userId});

  toJson() {
    return {
      "AttendanceId": attendanceId,
      "ClassId": classId,
      "IsPresent": isPresent,
      "MarkedAt": markedAt,
      "MarkedBy": markedBy,
      "SessionDate": sessionDate,
      "UserId": userId
    };
  }
}
