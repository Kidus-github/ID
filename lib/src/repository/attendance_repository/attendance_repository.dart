import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/exceptions/firebase_exceptions.dart';
import 'package:id/src/exceptions/format_exception.dart';
import 'package:id/src/exceptions/platform_exceptions.dart';
import 'package:id/src/models/attende_model.dart';
import 'package:id/src/models/class_student_model.dart';

class AttendeRepository extends GetxController {
  static AttendeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createAttede(AttendeModel attende) async {
    print("Something");
    try {
      print("someone");
      await _db.collection("Attende").doc(attende.id).set(attende.toJson());
      print("somewhere");
    } on FirebaseAuthExceptions catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseExceptions catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FormatExceptions catch (_) {
      throw const FormatExceptions();
    } on PlatformExceptions catch (e) {
      throw PlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  createStudent(ClassStudentModel student) async {
    print("createStudnet");
    try {
      await _db
          .collection("ClassAttendance")
          .doc(student.enrollmentId)
          .set(student.toJson());
    } on FirebaseAuthExceptions catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseExceptions catch (e) {
      throw FirebaseExceptions(e.code).message;
    } on FormatExceptions catch (_) {
      throw const FormatExceptions();
    } on PlatformExceptions catch (e) {
      throw PlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<Map<String, dynamic>>> fetchAttendeesDetails(
      String classid) async {
    List<Map<String, dynamic>> attendeesList = [];
    print("hello");
    try {
      // Step 1: Fetch documents from "ClassAttendance" where classId matches
      final QuerySnapshot classSnapshot = await _db
          .collection("ClassAttendance")
          .where("ClassId", isEqualTo: classid)
          .get();

      // Step 2: Extract student IDs
      List<String> studentIds = classSnapshot.docs
          .map((doc) {
            final data =
                doc.data() as Map<String, dynamic>?; // Explicitly cast to Map
            return data?["StudentId"] as String?;
          })
          .whereType<String>() // Remove null values
          .toList();
      print(studentIds);
      if (studentIds.isEmpty) return attendeesList;

      // Step 3: Fetch student names from "Attende" collection
      for (String studentId in studentIds) {
        final DocumentSnapshot studentSnapshot =
            await _db.collection("Attende").doc(studentId).get();

        if (studentSnapshot.exists) {
          final studentData =
              studentSnapshot.data() as Map<String, dynamic>?; // Explicit cast
          attendeesList.add({
            "studentId": studentId,
            "firstName": studentData?["FirstName"] ?? "Unknown",
            "middleName": studentData?["MiddleName"] ?? "Unknown",
          });
        }
      }

      return attendeesList;
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin, message: e.message);
    } on PlatformException catch (e) {
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
