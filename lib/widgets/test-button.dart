import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/style_text.dart';
class AnswerButton extends StatefulWidget {
  final String answer;
  final bool isSelected; 
  final bool isCorrect; 
  final VoidCallback onTap; 
  final bool isAnswered; 

  const AnswerButton({super.key, 
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
    required this.isAnswered, 
  });

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller; 
  late Animation<double> _scaleAnimation;
  bool _isTapped = false; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _handleTap() {
    if (widget.isAnswered) {
      return; 
    }

    _controller.forward().then((_) {
      setState(() {
        _isTapped = true; 
      });
      widget.onTap(); 
      _controller.reverse(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    IconData? iconData;

    if (widget.isSelected) {
      if (widget.isCorrect) {
        buttonColor = Colors.green; 
        iconData = Icons.check; 
      } else {
        buttonColor = Colors.red;
        iconData = Icons.close; 
      }
    } else {
      buttonColor = Colors.transparent; 
      iconData = null; 
    }

    return ScaleTransition(
      scale: _scaleAnimation, 
      child: GestureDetector(
        onTap: _handleTap, 
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8), 
          decoration: BoxDecoration(
            color: buttonColor, 
            borderRadius: BorderRadius.circular(8), 
            border: Border.all(color: Colors.blue), 
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.answer,
                  style: _isTapped ? TextStylesMain.alltxt : TextStylesMain.chattxt,
                ),
              ),
              if (iconData != null)
                Icon(
                  iconData,
                  color: Colors.black, 
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }
}