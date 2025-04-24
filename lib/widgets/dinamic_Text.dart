import 'package:flutter/material.dart';
import 'dart:async';
class DynamicTextByTime extends StatefulWidget {
  const DynamicTextByTime({super.key});

  @override
  _DynamicTextContainerState createState() => _DynamicTextContainerState();
}

class _DynamicTextContainerState extends State<DynamicTextByTime> {
  int _currentIndex = 0; //text index
  late Timer _timer;
  final List<String> _texts = [
  "Нет предела совершенству!",
    "Не имеет значения, где ты\nсейчас. Учиться можно везде!",
    "Обучайся и стань\nпрофессионалом!",
  ];//array data text


  @override
  void initState() {
    super.initState();
   //start timer
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _texts.length; //dinamic updata text index
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); //stop and clear stek
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
            textAlign:TextAlign.center,
            _texts[_currentIndex],
            style: const TextStyle(color: Color.fromRGBO(34, 75, 94, 1), 
            fontFamily: 'JockeyOne-Regular',
            fontSize: 16),
          ),
      
    
    );
  }

}
