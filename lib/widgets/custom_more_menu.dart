import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  final VoidCallback onSendImage;
  final VoidCallback onSendFile;
  final VoidCallback onSendAudio;

  const CustomDrawer({
    super.key,
    required this.onSendImage,
    required this.onSendFile,
    required this.onSendAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(24, 24, 24, 1),
        borderRadius: BorderRadius.circular(25),
        border: const Border(
          top: BorderSide(
            color: Color.fromRGBO(17, 174, 242, 1),
            width: 2.0,
          ),
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            title: const Text(
              'Фото',
              style: TextStyle(color: Colors.white),
            ),
            onTap: onSendImage,
          ),
          ListTile(
            leading: const Icon(Icons.attach_file, color: Colors.white),
            title: const Text(
              'Файл',
              style: TextStyle(color: Colors.white),
            ),
            onTap: onSendFile,
          ),
          ListTile(
            leading: const Icon(Icons.headphones, color: Colors.white),
            title: const Text(
              'Аудио',
              style: TextStyle(color: Colors.white),
            ),
            onTap: onSendAudio,
          ),
        ],
      ),
    );
  }
}