import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/exceptions/firebase_exceptions.dart';
import 'package:id/src/exceptions/format_exception.dart';
import 'package:id/src/exceptions/platform_exceptions.dart';
import 'package:id/src/models/attende_model.dart';

class AttendanceRepository extends GetxController {
  static AttendanceRepository get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  final _db = FirebaseFirestore.instance;

  Future<void> createAttede(AttendeModel attende) async {
    try {
      print("something");
      await _db.collection("Attende").doc(attende.id).set(attende.toJson());
      print("is");
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
}
