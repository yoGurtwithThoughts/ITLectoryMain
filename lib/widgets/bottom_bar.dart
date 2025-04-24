import 'package:flutter/material.dart';

class BottomBarWidget {
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color activeIconColor;
  final Color activeTextColor;
  final double iconSize;
  bool isActive;

  BottomBarWidget({
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.text,
    required this.textSize,
    required this.fontWeight,
    required this.activeIconColor,
    required this.activeTextColor,
    required this.iconSize,
    this.isActive = false,
  });

  void toggleActiveState() {
    isActive = !isActive;
  }

  Color getCurrentIconColor() {
    return isActive ? activeIconColor : iconColor;
  }

  Color getTextColor() {
    return isActive ? activeTextColor : textColor;
  }

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: iconSize,
        height: iconSize,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                icon,
                color: getCurrentIconColor(),
                size: iconSize,
              ),
            ),
            if (isActive)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 3.0,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(5, 96, 205, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0),
                      bottomRight: Radius.circular(3.0),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      label: text,
    );
  }
}