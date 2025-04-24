import 'package:flutter/material.dart';
import 'package:itlectory4/core/database_forchats.dart';
import 'package:itlectory4/core/databbase_helper.dart';
import 'package:itlectory4/pages/students/bt_logik.dart';
import 'package:itlectory4/widgets/all_button.dart';
import 'package:itlectory4/widgets/nav_text.dart';
import 'package:itlectory4/widgets/style_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _password = TextEditingController();
  final _login = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isObsText = true;

  @override
  void initState() {
    super.initState();
  }

  // Register new users
  void _registers() async {
    if (_formKey.currentState?.validate() ?? false) {
      String names = _login.text;
      String pass = _password.text;

      int id = await DatabaseHelper1.instance.insertUser1(names, pass, names);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  const Btlogick()),
            (Route<dynamic> route) => false,
      );

      _login.clear();
      _password.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Close keyboard when tapping outside
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 55, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Регистрация', style: TextStylesMain.title),
                            const SizedBox(height: 20),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 70,
                                    child: TextFormField(
                                      controller: _login,
                                      style: TextStylesMain.labeltxt,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets
                                            .symmetric(
                                            vertical: 18, horizontal: 10),
                                        labelStyle: TextStylesMain.labeltxt,
                                        labelText: 'Логин',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Пожалуйста, введите логин';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 70,
                                    child: TextFormField(
                                      obscureText: isObsText,
                                      controller: _password,
                                      style: TextStylesMain.labeltxt,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets
                                            .symmetric(
                                            vertical: 18, horizontal: 10),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isObsText = !isObsText;
                                            });
                                          },
                                          child: Icon(
                                            isObsText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                        ),
                                        labelStyle: TextStylesMain.labeltxt,
                                        labelText: 'Пароль',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                0, 134, 201, 1),
                                            width: 2.0,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Пожалуйста, введите пароль';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
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
                          bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom + 20,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 154, 222, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 45,
                              width: double.infinity,
                              child: AllButton(
                                onPressed: _registers,
                                buttonText: 'Зарегистрироваться',
                              ),
                            ),
                            const SizedBox(height: 15),
                            NavText(
                              onTap: () async {
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                await prefs.setBool('isLoggedIn', true);
                                Navigator.pushNamed(context, '/sgt');
                              },
                            ),
                          ],
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