import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/authrise_switch_widget.dart';


class MainButtonWidget extends StatefulWidget {
  const MainButtonWidget({super.key});

  @override
  State<MainButtonWidget> createState() => _MainButtonWidgetState();
}

class _MainButtonWidgetState extends State<MainButtonWidget>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward(); 
        setState(() {
          _isPressed = true; 
        });
      },
      onTapUp: (_) {
        _controller.reverse(); 
        setState(() {
          _isPressed = false; 
        });
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() {
          _isPressed = false; 
        });
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginWidget()),
        );
      },
      child: ScaleTransition(
        scale: _scaleAnimation, 
        child: Container(
          width: 256,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 154, 222, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Зарегистрироваться',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}