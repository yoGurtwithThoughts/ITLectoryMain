import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:itlectory4/core/chats_model.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/custom_chats.dart';
import 'package:itlectory4/widgets/custom_more_menu.dart';
import 'package:itlectory4/widgets/style_text.dart';

import '../../core/database_forchats.dart';

class ChatMessenger extends StatefulWidget {
   const ChatMessenger({super.key});

  @override
  State<ChatMessenger> createState() => _ChatMessengerState();
}

class _ChatMessengerState extends State<ChatMessenger> {
  bool _isMenuOpen = false;
  final TextEditingController _messagetxt = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Message> _messages = [];
  int? _replyToId;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    List<Message> messages = await _dbHelper.getMessages();
    setState(() {
      _messages = messages;
    });
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _sendMessage({String? imageUrl, String? filePath, String? audioPath, int? replyTo}) {
    if (_messagetxt.text.isNotEmpty || imageUrl != null || filePath != null || audioPath != null) {
      Message message = Message(
        id: DateTime.now().millisecondsSinceEpoch,
        sender:  'Student',
        content: _messagetxt.text,
        imageUrl: imageUrl,
        filePath: filePath,
        audioPath: audioPath,
        timestamp: DateTime.now(),
        replyTo: replyTo,
      );
      _dbHelper.insertMessage(message);
      _messagetxt.clear();
      _replyToId = null;
      _loadMessages();
    }
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _sendMessage(filePath: result.files.single.path, replyTo: _replyToId);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _sendMessage(filePath: result.files.single.path, replyTo: _replyToId);
    }
  }

  Future<void> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      String? audioPath = result.files.single.path;
      if (audioPath != null) {
        _sendMessage(filePath: result.files.single.path, replyTo: _replyToId);
      }
    } else {
      print('Выбор файла отменен');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 55),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: AppBarWidget(text: 'Чаты', isBack: true),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return CustomMessageWidgets(
                  message: message,

                );
              },
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 25,),
              Container(
                height: 55,
                width: 285,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 154, 222, 1),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _messagetxt,
                  style: TextStylesMain.alltxt,
                  decoration: const InputDecoration(
                    hintText: 'Введите сообщение',
                    hintStyle: TextStylesMain.chattxt,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Color.fromRGBO(0, 154, 222, 1)),
                onPressed: () {
                  _sendMessage(replyTo: _replyToId);
                  _replyToId = null;
                },
              ),
              GestureDetector(
                onTap: _toggleMenu,
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/moremenu.svg'),
                    const Text(
                      'Ещё',
                      style: TextStylesMain.apptxt1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isMenuOpen ? 250 : 0,
            child: _isMenuOpen
                ? CustomDrawer(
              onSendImage: _pickImage,
              onSendFile: _pickFile,
              onSendAudio: _pickAudio,
            )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}