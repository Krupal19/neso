import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constant/strings.dart';
import 'modules/no_internet/no_internet_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'bindings/network_binding.dart';
import 'services/network_controller.dart';
import 'utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final networkService = NetworkController.instance;

  await networkService.init();

  runApplication();
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  AppUtility.log('App Initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 744),
      builder: (context, child) {
        return GetMaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          initialBinding: NetworkBinding(),
          home: SplashScreen(),
        );
      },
    );
  }
}
