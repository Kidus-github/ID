import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AttendanceController extends GetxController {
  static AttendanceController get instance => Get.find();
  final isPresent = false.obs;
  // final String? attendanceId;
  // final String classId;
  // final String userId;
  // final DateTime sessionDate;
  // final bool isPresent;
  // final markedBy AuthenticationRepository.instance.authUser?.uid;
  // final markedAt = DateTime.now().obs;
}
