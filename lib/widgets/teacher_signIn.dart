import 'package:flutter/material.dart';
import 'package:itlectory4/core/data_user_teacher.dart';
import 'package:itlectory4/pages/home_teachers.dart';
import 'package:itlectory4/widgets/all_button.dart';
import 'package:itlectory4/widgets/style_text.dart';

class TeacherIn extends StatefulWidget {
  const TeacherIn({super.key});

  @override
  State<TeacherIn> createState() => _TeacherInState();
}

class _TeacherInState extends State<TeacherIn> {
  final _logtxt = TextEditingController();
  final _pastxt = TextEditingController();
  bool isObsText = true;

  void _login() {
    final String inputV = _logtxt.text;
    final String inputP = _pastxt.text;

    if (inputV == login && inputP == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const THome()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неправильные данные!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 55, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Авторизация', style: TextStylesMain.title),
                            const SizedBox(height: 20),
                            Form(
                              child: SizedBox(
                                height: 50,
                                width: 355,
                                child: TextFormField(
                                  controller: _logtxt,
                                  style: TextStylesMain.labeltxt,
                                  decoration: InputDecoration(
                                    labelStyle: TextStylesMain.labeltxt,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    labelText: 'Логин',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your login';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Form(
                              child: SizedBox(
                                height: 50,
                                width: 355,
                                child: TextFormField(
                                  controller: _pastxt,
                                  obscureText: isObsText,
                                  style: TextStylesMain.labeltxt,
                                  decoration: InputDecoration(
                                    labelStyle: TextStylesMain.labeltxt,
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isObsText = !isObsText;
                                        });
                                      },
                                      child: Icon(
                                        isObsText ? Icons.visibility_off : Icons.visibility,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    labelText: 'Пароль',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(0, 134, 201, 1),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                        ),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 154, 222, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 45,
                            width: double.infinity,
                            child: AllButton(
                              onPressed: _login,
                              buttonText: 'Войти',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}