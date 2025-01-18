class ClassStudentModel {
  final String? enrollmentId;
  final String classId;
  final String studentId;
  final DateTime enrolledAt;

  ClassStudentModel(
      {required this.classId,
      required this.studentId,
      required this.enrolledAt,
      this.enrollmentId});
}
