import 'package:flutter/material.dart';
import 'package:itlectory4/core/lection_theme_data.dart';
import 'package:itlectory4/pages/profile_page.dart';
import 'package:itlectory4/pages/students.dart';
import 'package:itlectory4/widgets/bottom_bar_view.dart';
import 'package:itlectory4/widgets/btb_logik.dart';
import 'package:itlectory4/widgets/chats_page.dart';


class THome extends StatefulWidget {
  const THome({super.key});

  @override
  _THomeState createState() => _THomeState();
}

class _THomeState extends State<THome> {
  int selectedIndex = 0;
  final String _selectedItem = StartWPF[0];

  static  final List<Widget> _widgetOptions = <Widget>[
    const THomeContent(),
    const ChatPage(),
    const ProfilePage(),
    const StudentsPage(),
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
      bottomNavigationBar: BottomBarr(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


