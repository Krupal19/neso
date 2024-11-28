import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../services/network_controller.dart';
import '../home/home_screen.dart';
import '../no_internet/no_internet_screen.dart';

class SplashController extends GetxController {
  final NetworkController _networkController = NetworkController.instance;

  @override
  void onInit() {
    super.onInit();

    // Initialize the network controller
    _networkController.init();

    print("check value : ${_networkController.isConnected.value}");

    Future.delayed(const Duration(seconds: 1), () {
      if (_networkController.isConnected.value) {
        // If connected, navigate to HomeScreen
        print("Go to home screen");
        Get.offAll(() => const HomeScreen());
      } else {
        print("Go to no internet screen");
        // If not connected, navigate to NoInternetScreen
        Get.offAll(() => const NoInternetScreen());
      }
    });

    // // Start listening to the network status
    // ever(_networkController.isConnected, (bool connected) {
    //   if (!connected) {
    //     if (!Get.isSnackbarOpen) {
    //       Get.snackbar(
    //         "No Network Connection",
    //         "Check your internet connection",
    //         snackPosition: SnackPosition.BOTTOM,
    //         backgroundColor: const Color(0xFFFF7F7F),
    //         colorText: Colors.white,
    //         borderColor: Colors.redAccent,
    //         borderWidth: 2,
    //         icon: const Icon(Icons.wifi_off),
    //         margin: const EdgeInsets.all(12),
    //         isDismissible: false,
    //         duration: const Duration(days: 365),
    //       );
    //     }
    //   } else {
    //     if (Get.isSnackbarOpen) {
    //       Get.back();
    //     }
    //   }
    // });
    //
    // // Wait for a few seconds and proceed with navigation
    // Future.delayed(const Duration(seconds: 3), () {
    //   if (_networkController.isConnected.value) {
    //     Get.offAll(() => const HomeScreen());
    //   } else {
    //     Get.offAll(() => const NoInternetScreen());
    //   }
    // });
  }
}