import 'package:flutter/material.dart';
import 'package:itlectory4/pages/page_register.dart';
import 'package:itlectory4/widgets/dinamic_Text.dart';
import 'package:itlectory4/widgets/main_button.dart';
import 'package:itlectory4/widgets/nav_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/animatedBilder.dart';
import '../widgets/hot_navigation_button.dart';
import 'package:shake/shake.dart';


class OnBoard1 extends StatefulWidget {
  const OnBoard1({super.key});

  @override
  State<OnBoard1> createState() => _OnBoard1State();
}

class _OnBoard1State extends State<OnBoard1> {
  ShakeDetector? _shakeDetector;

  @override
  void initState() {
    super.initState();
    _startListening();


  }

  void _startListening() {
    _shakeDetector = ShakeDetector.autoStart(
    onPhoneShake: (acceleration) {
  _navigateToNextPage();
},
    );
  }

  void _navigateToNextPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _shakeDetector?.stopListening();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 295, top: 25),
                child: HotButtonMenu(),),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              PulsatingCircle(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 25,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    DynamicTextByTime(),
                    const SizedBox(height: 150,),
                    MainButtonWidget(),
                    SizedBox(height: 15,),
                    NavText(onTap: (){
                      Navigator.pushNamed(context, '/sg');
                    },),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}