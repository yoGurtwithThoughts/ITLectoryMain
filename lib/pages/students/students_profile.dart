import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/profile-image.dart';
import 'package:itlectory4/widgets/sign_up.dart';
import 'package:itlectory4/widgets/students-info-widget.dart';
import 'package:itlectory4/widgets/style_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageStudent extends StatefulWidget {
  const ProfilePageStudent({super.key});

  @override
  State<ProfilePageStudent> createState() => _ProfilePageStateStudent();
}

class _ProfilePageStateStudent extends State<ProfilePageStudent> {
  String _userName = "Ваше имя";
  final TextEditingController _nameController =
      TextEditingController();

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
                child:  AppBarWidget(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpWidget()),
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
                    'Cтудент',
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
              Center(
                child: Column(
                  children: [
                    ButtonInkwell(
                      onTap: () {
                        _showProgressDialog(context);
                      },
                      buttonTxt: 'Прогресс',
                    ),
                    const SizedBox(height: 25),
                    ButtonInkwell(
                      onTap: () {
                        Navigator.pushNamed(context, '/test');
                      },
                      buttonTxt: 'Тесты',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.7),
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 250,
            width: 250,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(45, 45, 45, 0.65),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Прогресс: 15%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                CustomPaint(
                  size: const Size(75, 75),
                  painter: ProgressPainter(progress: 0.15),
                ),
                const SizedBox(height: 35),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: 35,
                    color: Colors.white.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = const Color.fromRGBO(45, 45, 45, 0.55) // Цвет границы (серый)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Paint progressPaint = Paint()
      ..color = const Color.fromRGBO(17, 174, 242, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        backgroundPaint);
    double sweepAngle = 2 * 3.14159265359 * progress;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      -3.14159265359 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
