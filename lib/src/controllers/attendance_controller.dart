import 'package:get/get.dart';
import 'package:id/src/repository/attendance_repository/attendance_repository.dart';
import 'package:id/src/repository/class_repository/class_repository.dart';

class AttendanceController extends GetxController {
  static AttendanceController get instance => Get.find();

  String id = '';
  final isPresent = false.obs;
  final attendeloading = false.obs;
  final attendanceRepo = Get.put(AttendeRepository());
  final classRepo = Get.put(ClassRepository());

  final filtertype = ['All', 'Male', 'Female'];
  final selectedFilter = ''.obs;

  RxList<Map<String, dynamic>> attendes = <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> allAttendees =
      []; // Store the original list separately

  @override
  void onInit() {
    super.onInit();
    fetchClassDetail(id);
  }

  Future<void> fetchClassDetail(String classId) async {
    try {
      final fetchedClass = await classRepo.fetchClassDetail(classId);
      if (fetchedClass.startDateTime.day == DateTime.now().day ||
          fetchedClass.endDateTime.isAfter(DateTime.now())) {
        print('This statement runs true');
        print('This is the id: $classId');
        fetchAttendesRecord(classId);
      }

      print(fetchedClass.startDateTime.day == DateTime.now().day ||
          fetchedClass.endDateTime.day > DateTime.now().day ||
          fetchedClass.endDateTime.month > DateTime.now().month ||
          fetchedClass.endDateTime.year > DateTime.now().year);
      print("class hasnt started yet");
    } catch (e) {
      print("Error fetching records: $e");
    }
  }

  Future<void> fetchAttendesRecord(String classId) async {
    print("Fetching attende records...");
    try {
      attendeloading.value = true;
      final fetchedClasses =
          await attendanceRepo.fetchAttendeesDetails(classId);
      print("Fetched records: $fetchedClasses");

      attendes.assignAll(fetchedClasses);
      allAttendees = List.from(fetchedClasses);
    } catch (e) {
      print("Error fetching records: $e");
      attendes.assignAll(attendeData);
      allAttendees = List.from(attendeData);
    } finally {
      attendeloading.value = false;
    }
  }

  void runFilter(String searchInput) {
    if (searchInput.isEmpty) {
      attendes.assignAll(List.from(allAttendees)); // Restore original list
    } else {
      attendes.assignAll(
        allAttendees.where((attende) {
          return attende["firstName"]
              .toLowerCase()
              .contains(searchInput.toLowerCase());
        }).toList(),
      );
    }
  }

  void filter(String selectedFilter) {
    if (selectedFilter.isEmpty || selectedFilter == "All") {
      attendes.assignAll(List.from(allAttendees)); // Restore original list
    } else {
      attendes.assignAll(
        allAttendees.where((attende) {
          switch (selectedFilter) {
            case 'Male':
              print('Male list : ${attende["gender"].toLowerCase() == "male"}');
              return attende["gender"]?.toLowerCase() == "male";
            case 'Female':
              return attende["gender"].toLowerCase() == "female";
            // case 'Batch':
            //   return attende.containsKey("batch"); // Ensures batch exists
            default:
              return false; // Prevents null return
          }
        }).toList(),
      );

      // Apply sorting after filtering
      if (selectedFilter == "A-Z") {
        attendes.sort((a, b) => a["firstName"].compareTo(b["firstName"]));
      }
    }
  }

  List<Map<String, dynamic>> attendeData = [
    {'firstName': 'Mekdelawit', 'middleName': 'Teshome', 'status': true},
    {'firstName': 'Birucktawit', 'middleName': 'Adugna', 'status': false},
    {'firstName': 'Hanna', 'middleName': 'Yohannes', 'status': false},
    {'firstName': 'Ruhama', 'middleName': 'Wale', 'status': false},
    {'firstName': 'Liyuwork', 'middleName': 'Kebede', 'status': false},
    {'firstName': 'Edna', 'middleName': 'Mesfin', 'status': false},
    {'firstName': 'Arsema', 'middleName': 'Hailu', 'status': false},
  ];

  ///create attendance every recuring event so check for the event or class start and end date and if today is equal to the event
  ///and if the repeating date is today create attendance with the lists of students who are enrolled to this specific class
  ///or event then let the status changes or let the user make changes on the attendance then as the event ends meaning when the
  ///event end time plus 2hr is reached submit the attendance and upload it to the firebase
  ///and also save it to the local storage if possible then for the record place show or let users download it in csv format.
  ///
}
