import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:id/src/utils/loader/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  // Updated to handle a list of ConnectivityResults
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Now handles a list of results
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    // Assuming we only care about the first active connection
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

    if (_connectionStatus.value != result) {
      _connectionStatus.value = result;

      if (result == ConnectivityResult.none) {
        Loaders.warningSnackBar(title: 'No Internet Connection');
      } else {
        Loaders.successSnackBar(title: 'Internet Connection Restored');
      }
    }
  }

  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();
      return results.isNotEmpty && results.first != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  ConnectivityResult get connectionStatus => _connectionStatus.value;

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
