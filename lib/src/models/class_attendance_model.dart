class ClassAttendanceModel {
  final String? attendance_id;
  final String class_id;
  final String user_id;
  final DateTime session_date;
  final bool is_present;
  final String marked_by;
  final String marked_at;

  ClassAttendanceModel(
      {this.attendance_id,
      required this.class_id,
      required this.is_present,
      required this.marked_at,
      required this.marked_by,
      required this.session_date,
      required this.user_id});
}
