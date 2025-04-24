import 'package:flutter/material.dart';

class PulsatingCircle extends StatefulWidget {
  const PulsatingCircle({super.key});

  @override
  _PulsatingCircleState createState() => _PulsatingCircleState();
}

class _PulsatingCircleState extends State<PulsatingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

   
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
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
   @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 100 * _animation.value,
            height: 100 * _animation.value, 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.05),
              border: Border.all(
                  color: const Color.fromRGBO(36, 109, 132, 1), // Цвет обводки
                  width: 2.5, // Ширина обводки
                ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 15 * _animation.value,
                  spreadRadius: 2.5,
                ),
              ],
            ),
            child: const Center(
              child: Text('IT', textAlign: TextAlign.center, 
            style: TextStyle(fontFamily: 'JockeyOne-Regular', fontWeight: FontWeight.w700,
            fontSize: 64, color: Color.fromRGBO(0, 137, 201, 1))),),
          );
        },
      ),
    );
  }
  }