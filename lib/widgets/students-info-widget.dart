import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/style_text.dart';

class ButtonInkwell extends StatelessWidget {
  final String buttonTxt;
  final VoidCallback onTap;

  const ButtonInkwell({super.key, required this.onTap, required this.buttonTxt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(32, 32, 32, 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    width: 5,
                    color: const Color.fromRGBO(16, 64, 99, 1),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 5,
                    color: const Color.fromRGBO(16, 64, 99, 1),
                  ),
                ),
              ),
              Center(
                child: Text(
                  buttonTxt,
                  style: TextStylesMain.themetxt,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

