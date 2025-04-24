import 'package:flutter/material.dart';
import 'package:itlectory4/core/chats_model.dart';

class CustomMessageWidget extends StatelessWidget {
  final Message message;

  const CustomMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'student'
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(53, 51, 51, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),
            if (message.imageUrl != null) ...[
              const SizedBox(height: 5),
              Image.network(message.imageUrl!,
                  width: 100, height: 100, fit: BoxFit.cover),
            ],
            if (message.filePath != null) ...[
              const SizedBox(height: 5),
              Text(
                'Файл: ${message.filePath}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
            if (message.audioPath != null) ...[
              const SizedBox(height: 5),
              Text(
                'Аудио: ${message.audioPath}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
