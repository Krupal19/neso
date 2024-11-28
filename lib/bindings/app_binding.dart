import 'package:get/get.dart';
import 'package:neso/services/network_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
