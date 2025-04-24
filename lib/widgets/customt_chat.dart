import 'package:flutter/material.dart';
import 'package:itlectory4/core/chats_model.dart';


class CustomMessageWidget1 extends StatelessWidget {
  final Message message;
  final Function(int) onReply;

  const CustomMessageWidget1({super.key, required this.message, required this.onReply});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'teacher' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 39, 39, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}