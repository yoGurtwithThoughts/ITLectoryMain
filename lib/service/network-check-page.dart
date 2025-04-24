import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itlectory4/widgets/style_text.dart';


class CheckNetWork extends StatefulWidget {
  const CheckNetWork({super.key});

  @override
  State<CheckNetWork> createState() => _CheckNetWorkState();
}

class _CheckNetWorkState extends State<CheckNetWork>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isChecking = false; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> checkConnection() async {
    setState(() {
      _isChecking = true;
    });

    bool hasInternet =
        await InternetConnectionChecker.createInstance().hasConnection;

    setState(() {
      _isChecking = false;
    });

    if (hasInternet) {
      Navigator.of(context).pushReplacementNamed('/onb1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Темный фон
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cloud.png',
                        width: 200,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      ScaleTransition(
                        scale: _animation,
                        child: Image.asset(
                          'assets/images/error.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Нет подключения к интернету",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 40.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _isChecking ? null : checkConnection,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(0, 162, 225, 1),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: _isChecking
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Повторить попытку", style: TextStylesMain.alltxt),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
