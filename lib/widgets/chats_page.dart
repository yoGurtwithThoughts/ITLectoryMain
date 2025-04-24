import 'package:flutter/material.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/chats_widget.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return const Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 35,),
                    AppBarWidget(text: 'Чаты', isBack: false),
                    SizedBox(
                      height: 55,
                    ),
                  ChatCardWidget(name: 'Студент 1', indexMessage: 5,
                      subtitle: 'Новое сообщение'
                  ),
                    SizedBox(height: 25,),
                    ChatCardWidget(name: 'Студент 2', indexMessage: 1,
                    subtitle: 'Новое сообщение',),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
