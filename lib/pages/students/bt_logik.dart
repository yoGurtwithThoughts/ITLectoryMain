import 'package:flutter/material.dart';
import 'package:itlectory4/pages/students/bottom_for_students.dart';
import 'package:itlectory4/pages/students/students_profile.dart';
import 'package:itlectory4/pages/students/test-page.dart';
import 'package:itlectory4/widgets/btb_logik.dart';
import 'package:itlectory4/widgets/chats_page.dart';

class Btlogick extends StatefulWidget {
  const Btlogick({super.key});

  @override
  State<Btlogick> createState() => _BtlogickState();
}

class _BtlogickState extends State<Btlogick> {
  int selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    const THomeContent(),
    const ChatPage(),
    const ProfilePageStudent(),
    const TestPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomBarrs(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


