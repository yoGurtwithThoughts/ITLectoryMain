import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itlectory4/service/network-check-page.dart';
import 'package:itlectory4/widgets/splash.dart';


Future<Widget> handleInitialConnectivity() async {
  try {
    // Получаем текущее состояние подключения (список)
    List<ConnectivityResult> connectivityResults = await Connectivity().checkConnectivity();
    ConnectivityResult connectivityResult = connectivityResults.isNotEmpty ? connectivityResults.first : ConnectivityResult.none;

    if (connectivityResult == ConnectivityResult.none) {
      return const CheckNetWork();
    }

    // Проверяем доступность интернета
    final bool hasInternet = await InternetConnectionChecker.createInstance().hasConnection;
    if (!hasInternet) {
      return const CheckNetWork();
    }

    return const SplashScreen();
  } catch (e) {
    if (kDebugMode) {
      print("Error checking connectivity: $e");
    }
    return const CheckNetWork();
  }
}
