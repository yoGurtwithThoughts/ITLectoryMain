import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
class CustomDraver extends StatefulWidget {
  const CustomDraver({super.key});

  @override
  State<CustomDraver> createState() => _CustomDraverState();
}

class _CustomDraverState extends State<CustomDraver> {

  bool _isMenuOpen = false;
  final TextEditingController _messagetxt = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messagetxt.text.isNotEmpty) {
      setState(() {
        _messages.add(_messagetxt.text);
      });
      _messagetxt.clear();
    }
  }
  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _messages.add('Изображение: ${image.name}');
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _messages.add('Файл: ${result.files.single.name}');
      });
    }
  }


  Future<void> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {

        setState(() {
          _messages.add('Аудиофайл: ${result.files.single.name}');
        });
      }
    } else {
      print('Выбор файла отменен');
    }
  }

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

      ),);
    }}
