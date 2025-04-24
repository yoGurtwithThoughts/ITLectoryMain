import 'package:flutter/material.dart';
import 'package:itlectory4/pages/home_teachers.dart';
import 'package:itlectory4/pages/onboard_1.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goHome();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;


    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const THome()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoard1()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:  Image.asset('assets/images/Loggo.png',
            fit: BoxFit.contain,),)
    );
  }

  _goHome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const OnBoard1()),
    );
  }
}