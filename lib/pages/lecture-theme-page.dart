import 'package:flutter/material.dart';
import 'package:itlectory4/core/topic-provider.dart';
import 'package:itlectory4/widgets/style_text.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LectureThemePage extends StatefulWidget {
  final bool isBack;

  const LectureThemePage({super.key, this.isBack = true});

  @override
  _LectureThemePageState createState() => _LectureThemePageState();
}

class _LectureThemePageState extends State<LectureThemePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождение ресурсов
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopicProvider>(
      builder: (context, topicProvider, child) {
        final selectedTitle = topicProvider.selectedLecture?.title ?? 'Тема';
        final selectedContent = topicProvider.selectedLecture?.content ?? '';

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              selectedTitle,
              style: TextStylesMain.buttontxt,
              textAlign: TextAlign.center,
            ),
            leading: widget.isBack
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Color.fromRGBO(0, 85, 150, 1)),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : const SizedBox(width: 24),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildContent(selectedContent),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(String content) {
    return AnimatedOpacity(
      opacity: _animation.value, // Плавное появление контента
      duration: const Duration(seconds: 1),
      child: AutoSizeText(
        content.isEmpty ? 'Контент недоступен' : content, // Обработка пустого контента
        style: TextStylesMain.themetxt,
        textAlign: TextAlign.justify,
        maxLines: 450, // Ограничение по строкам
        overflow: TextOverflow.clip, // Поведение текста при переполнении
      ),
    );
  }
}