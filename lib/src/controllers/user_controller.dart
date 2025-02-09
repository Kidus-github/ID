import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:id/src/models/user_model.dart';
import 'package:id/src/utils/loader/loaders.dart';

import '../repository/user_repository/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final profileloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('UserController initialized.');
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileloading.value = true;
      print('Fetching user record...');

      final fetchedUser = await userRepository.fetchUserDetails();

      print('Fetched User: $fetchedUser');

      if (fetchedUser != null) {
        this.user(fetchedUser);
        user.value = fetchedUser;
      } else {
        print('User data is null');
      }
    } catch (e) {
      print('Error fetching user: $e');
      user.value = UserModel.empty();
    } finally {
      profileloading.value = false;
      print('Fetch user record completed.');
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: userCredential.user!.displayName ?? '',
          middleName: userCredential.user!.displayName!.split("").length > 1
              ? userCredential.user!.displayName!.split("").sublist(1).join('')
              : '',
          email: userCredential.user!.email ?? '',
          phoneNo: userCredential.user!.phoneNumber ?? '',
          nfcTagId: '',
          profilePic: userCredential.user!.photoURL,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await UserRepository.instance.createUser(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your infomation. You can re-save your data in your Profile.');
    }
  }
}
