import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../utility/utility.dart';

class NetworkController extends GetxController {
  // Singleton Instance
  static final NetworkController _instance = NetworkController._internal();

  static NetworkController get instance => _instance;

  NetworkController._internal();

  // Reactive variable to track network connectivity
  var isConnected = false.obs;

  // Internal Connectivity instance
  final _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _streamSubscription;

  // Initialization flag
  var isInitialized = false;

  // Initialize the Network Controller
  Future<void> init() async {
    AppUtility.log('NetworkController Initializing');
    if (isInitialized) {
      AppUtility.log('NetworkController Already Initialized');
      return;
    }
    _checkForInternetConnectivity();
    isInitialized = true;
    AppUtility.log('NetworkController Initialized');
  }

  // Dispose resources
  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  // Private method to monitor connectivity changes
  void _checkForInternetConnectivity() {
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        isConnected.value = true;
        AppUtility.log('Connected to the internet');
      } else {
        isConnected.value = false;
        AppUtility.log('No Internet Connection');
      }
    });
  }
}
