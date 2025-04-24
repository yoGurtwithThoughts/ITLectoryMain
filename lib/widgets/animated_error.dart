import 'package:flutter/material.dart';

class PulsatingError extends StatefulWidget {
  const PulsatingError({super.key});

  @override
  _PulsatingErrorState createState() => _PulsatingErrorState();
}

class _PulsatingErrorState extends State<PulsatingError>
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
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Center(
            child: Positioned(
              top: 250,
              left: 0,
              right: 0,
              bottom: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Positioned.fill(
                    child: Container(
                    child:  Image.asset('assets/images/cloud.png',
                      fit: BoxFit.contain,),
                    ),
                  ),
                  Image.asset('assets/images/error.png',
                    height: 35 * _animation.value,
                    width: 25 * _animation.value,
                    fit: BoxFit.contain,),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
