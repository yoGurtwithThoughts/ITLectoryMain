import 'package:flutter/material.dart';
import 'package:itlectory4/core/data_user.dart';
import 'package:itlectory4/pages/students/bt_logik.dart';
import 'package:itlectory4/widgets/all_button.dart';
import 'package:itlectory4/widgets/style_text.dart';
class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _recordBookController = TextEditingController();

  void _login() {
    final String inputRecordBook = _recordBookController.text;

    if (inputRecordBook == rcbook) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Btlogick()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Неправильные данные')),
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
                    children: [
                      const SafeArea(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 55, left: 25, right: 25),
                          child: Text(
                            'Авторизация',
                            style: TextStylesMain.title,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: _recordBookController,
                          style: TextStylesMain.labeltxt,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 10),
                            labelStyle: TextStylesMain.labeltxt,
                            labelText: '№ зачетной книжки',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 134, 201, 1),
                                width: 2.0,
                              ),
                            ),
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
                                color: Colors.red,
                                width: 2.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.red,
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
                              buttonText: 'Авторизоваться',
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
