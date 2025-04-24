import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkMonitor extends StatefulWidget {
  final Widget child;

  const NetworkMonitor({super.key, required this.child});

  @override
  _NetworkMonitorState createState() => _NetworkMonitorState();
}

class _NetworkMonitorState extends State<NetworkMonitor> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    bool hasInternet = await InternetConnectionChecker.createInstance().hasConnection;

    if (!_isConnected && hasInternet) {
      // Если раньше не было соединения, но оно появилось, показываем уведомление
      _showConnectionRestored();
    }

    setState(() {
      _isConnected = hasInternet;
    });
  }

  void _showConnectionRestored() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ConnectionRestoredScreen()),
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class ConnectionRestoredScreen extends StatelessWidget {
  const ConnectionRestoredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/onb1'); // Переход на OnBoard1
    });

    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Соединение восстановлено!",
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
