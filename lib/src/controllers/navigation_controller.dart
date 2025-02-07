import 'package:get/get.dart';
import 'package:id/src/screens/AppointmentScreen/appointment_screen.dart';
import 'package:id/src/screens/NotificationScreen/notification_screen.dart';
import 'package:id/src/screens/SettingsScreen/setting_screen.dart';
import 'package:id/src/screens/TeacherScreen/teacher_home_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const TeacherHomeScreen(),
    const AppointmentScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];
}
