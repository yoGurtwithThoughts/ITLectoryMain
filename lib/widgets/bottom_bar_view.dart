import 'package:flutter/material.dart';
import 'package:itlectory4/pages/profile_page.dart';
import 'package:itlectory4/pages/students.dart';
import 'package:itlectory4/widgets/bottom_bar.dart';
import 'package:itlectory4/widgets/chats_page.dart';

import 'btb_logik.dart';
class BottomBarr extends StatelessWidget {
final int selectedIndex;
final Function(int) onItemTapped;

const BottomBarr({super.key, required this.selectedIndex, required this.onItemTapped});
static  final List<Widget> _widgetOptions = <Widget>[
  const ChatPage(),
  const ProfilePage(),
  const StudentsPage(),
   const THomeContent(),
];
@override
Widget build(BuildContext context) {
  return BottomNavigationBar(
    backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
    type: BottomNavigationBarType.fixed,
    items: [
      BottomBarWidget(
        icon: Icons.list_alt,
        iconColor: selectedIndex == 0
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        textColor: selectedIndex == 0
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        text: 'Курс',
        textSize: 12.0,
        fontWeight: FontWeight.w400,
        activeIconColor: const Color.fromRGBO(5, 96, 205, 1),
        activeTextColor: const Color.fromRGBO(5, 96, 205, 1),
        isActive: selectedIndex == 0,
        iconSize: 24.0,
      ).toBottomNavigationBarItem(),

      BottomBarWidget(
        icon: Icons.chat,
        iconColor: selectedIndex == 1
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        textColor: selectedIndex == 1
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        text: 'Чаты',
        textSize: 12.0,
        fontWeight: FontWeight.w400,
        activeIconColor: const Color.fromRGBO(5, 96, 205, 1),
        activeTextColor: const Color.fromRGBO(5, 96, 205, 1),
        isActive: selectedIndex == 1,
        iconSize: 24,
      ).toBottomNavigationBarItem(),

      BottomBarWidget(
        icon: Icons.account_circle_outlined,
        iconColor: selectedIndex == 2
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        textColor: selectedIndex == 2
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        text: 'Профиль',
        textSize: 12.0,
        activeIconColor: const Color.fromRGBO(5, 96, 205, 1),
        activeTextColor: const Color.fromRGBO(5, 96, 205, 1),
        fontWeight: FontWeight.w400,
        isActive: selectedIndex == 2,
        iconSize: 24,
      ).toBottomNavigationBarItem(),

      BottomBarWidget(
        icon: Icons.person_4_outlined,
        iconColor: selectedIndex == 3
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        textColor: selectedIndex == 3
            ? const Color.fromRGBO(5, 96, 205, 1)
            : Colors.grey,
        text: 'Студенты',
        textSize: 12.0,
        activeIconColor: const Color.fromRGBO(5, 96, 205, 1),
        activeTextColor: const Color.fromRGBO(5, 96, 205, 1),
        isActive: selectedIndex == 3,
        fontWeight: FontWeight.w400,
        iconSize: 24,
      ).toBottomNavigationBarItem(),
    ],
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    selectedItemColor: const Color.fromRGBO(5, 96, 205, 1),
  );
}
}


