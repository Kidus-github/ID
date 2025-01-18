class CoTeacherAssignmentModel {
  final String? assignmentId;
  final String classId;
  final String coTeacherId;
  final DateTime assignedAt;

  CoTeacherAssignmentModel(
      {required this.classId,
      required this.coTeacherId,
      required this.assignedAt,
      this.assignmentId});
}
