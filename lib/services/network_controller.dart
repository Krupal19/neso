import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/utility.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      AppUtility.log('No Internet Connection');
      Get.snackbar(
        "No Network Connection",
        "Check your internet connection",
        isDismissible: false,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.GROUNDED,
        backgroundColor: const Color(0xFFFF7F7F),
        colorText: Colors.white,
        borderColor: Colors.redAccent,
        borderWidth: 2,
        icon: const Icon(Icons.wifi_off, color: Colors.white),
        margin: const EdgeInsets.all(10),
        duration: const Duration(days: 1),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        AppUtility.log('Connected to the internet');
      }
    }
  }
}
