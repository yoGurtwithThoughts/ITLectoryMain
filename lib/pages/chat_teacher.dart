import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:itlectory4/core/chats_model.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/custom_more_menu.dart';
import 'package:itlectory4/widgets/customt_chat.dart';
import 'package:itlectory4/widgets/style_text.dart';
import '../../core/database_forchats.dart';

class ChatTeacer extends StatefulWidget {
  const ChatTeacer({super.key});

  @override
  State<ChatTeacer> createState() => _ChatTeacerState();
}

class _ChatTeacerState extends State<ChatTeacer> {
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

  void _sendMessages(
      {String? imageUrl, String? filePath, String? audioPath, int? replyTo}) {
    if (_messagetxt.text.isNotEmpty ||
        imageUrl != null ||
        filePath != null ||
        audioPath != null) {
      Message message = Message(
        sender: 'Teacher',
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
      _sendMessages(filePath: result.files.single.path, replyTo: _replyToId);
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _sendMessages(filePath: result.files.single.path, replyTo: _replyToId);
    }
  }

  Future<void> _pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );

    if (result != null) {
      String? audioPath = result.files.single.path;
      if (audioPath != null) {
        _sendMessages(filePath: result.files.single.path, replyTo: _replyToId);
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
            padding: EdgeInsets.only(left: 35),
            child: AppBarWidget(text: 'Чаты', isBack: true),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: CustomMessageWidget1(
                          message: message,
                          onReply: (replyToId) {
                            setState(() {
                              _replyToId = replyToId;
                              _messagetxt.text = message.content;
                            });
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 35,),
                       Container(
                          height: 55,
                          width: 340,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color.fromRGBO(0, 154, 222, 1),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.only(left: 55),
                            child: TextField(
                                controller: _messagetxt,
                                style: TextStylesMain.alltxt,
                                decoration: const InputDecoration(
                                  hintText: 'Введите сообщение',
                                  hintStyle: TextStylesMain.chattxt,
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                ),
                                maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                            ),
                          ),
                        ),
                      IconButton(
                        icon: const Icon(Icons.send,
                            color: Color.fromRGBO(0, 154, 222, 1)),
                        onPressed: () {
                          _sendMessages(replyTo: _replyToId);
                          _replyToId = null;
                        },
                      ),
                      const SizedBox(height: 10,),
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
                    height: _isMenuOpen ? 350 : 0,
                    child: _isMenuOpen
                        ? CustomDrawer(
                            onSendImage: _pickImage,
                            onSendFile: _pickFile,
                            onSendAudio: _pickAudio,
                          )
                        : const SizedBox.shrink(),
      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
