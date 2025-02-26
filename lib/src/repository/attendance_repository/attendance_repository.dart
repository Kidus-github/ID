import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:id/src/exceptions/firebase_auth_exception.dart';
import 'package:id/src/exceptions/firebase_exceptions.dart';
import 'package:id/src/exceptions/format_exception.dart';
import 'package:id/src/exceptions/platform_exceptions.dart';
import 'package:id/src/models/attende_model.dart';

class AttendeRepository extends GetxController {
  static AttendeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createAttede(AttendeModel attende) async {
    try {
      await _db.collection("Attende").doc(attende.id).set(attende.toJson());
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
