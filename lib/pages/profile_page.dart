import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:itlectory4/pages/page_register.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/infobanner.dart' show Info, InfoBanner;
import 'package:itlectory4/widgets/profile-image.dart';
import 'package:itlectory4/widgets/style_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _userName = "Ваше имя";

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? "Ваше имя";
    });
  }

  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  void _editName() {
    _nameController.text = _userName;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
          title: const Text(
            "Редактировать имя",
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              hintText: "Введите ваше имя",
              hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
              // Hint text color
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Отмена",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _userName = _nameController.text;
                });
                await _saveUserName(_userName);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.blueAccent,
                shadowColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                side: const BorderSide(color: Colors.blueAccent),
              ),
              child: const Text(
                "Сохранить",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 38),
          Stack(
            children: [
              const Center(
                child: AppBarWidget(
                  text: 'Профиль',
                  isBack: false,
                ),
              ),
              Positioned(
                right: 45,
                top: 0,
                child: InkWell(
                  onTap: _editName,
                  child: SvgPicture.asset(
                    'assets/icons/Edit.svg',
                    height: 45,
                    width: 45,
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 10,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                    },
                  child: SvgPicture.asset(
                    'assets/images/logout.svg',
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 45),
              const UserProfile(),
              const SizedBox(height: 30),
              Text(_userName, style: TextStylesMain.themetxt),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Преподаватель',
                    style: TextStylesMain.title,
                  ),
                  const SizedBox(width: 30),
                  SvgPicture.asset(
                    'assets/icons/teacher.svg',
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
             const SizedBox(height: 25),
            const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 45, height: 20),
                    InfoBanner(
                      infoTxt: 'группы',
                      countInfo: '4',
                    ),
                    SizedBox(width: 15),
                    InfoBanner(
                      infoTxt: 'лекций',
                      countInfo: '10',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Info(
                      inf2: 'Уровень\nстудентов',
                      inf1: '67%',
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
