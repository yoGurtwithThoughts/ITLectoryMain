import 'package:flutter/material.dart';
import 'package:itlectory4/core/database_forchats.dart';
import 'package:itlectory4/core/databbase_helper.dart';
import 'package:itlectory4/pages/students/bt_logik.dart';
import 'package:itlectory4/widgets/all_button.dart';
import 'package:itlectory4/widgets/style_text.dart';
class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _recordBook = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _recordBook.text;
      int id = await DatabaseHelper2.instance.insertUser(name);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Btlogick()),
      );
      _recordBook.clear();
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
                    children: [
                      const SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(top: 55, left: 25, right: 25),
                          child: Text(
                            'Регистрация',
                            style: TextStylesMain.title,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _recordBook,
                            style: TextStylesMain.labeltxt,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 10),
                              labelStyle: TextStylesMain.labeltxt,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 134, 201, 1),
                                  width: 2.0,
                                ),
                              ),
                              labelText: '№ зачетной книжки',
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 134, 201, 1),
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 134, 201, 1),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Пожалуйста, введите номер зачетной книжки';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 25,
                            right: 25,
                            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 154, 222, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: 45,
                            width: double.infinity,
                            child: AllButton(
                              onPressed: _register,
                              buttonText: 'Зарегистрироваться',
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