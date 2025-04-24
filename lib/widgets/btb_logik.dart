import 'package:flutter/material.dart';
import 'package:itlectory4/core/theme_lection.dart';
import 'package:itlectory4/core/topic-provider.dart';
import 'package:itlectory4/widgets/appbar_widget.dart';
import 'package:itlectory4/widgets/list_theme_widget.dart';
import 'package:itlectory4/widgets/title_widget.dart';
import 'package:provider/provider.dart';

class THomeContent extends StatelessWidget {
  const THomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Выровнять все элементы по левому краю
        children: [
          const SizedBox(height: 35), // Отступ сверху
          const AppBarWidget(
            text: 'Введение в WPF', // Заголовок страницы
            isBack: false, // Без кнопки "назад"
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10, top: 35), // Отступы слева и сверху
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, 
              children: categories
                  .map((category) => _buildCategory(context, category))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Функция для создания секции категории с заголовком и списком лекций
  Widget _buildCategory(BuildContext context, Category category) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Выровнять элементы по левому краю
      children: [
        TitleWidget(title: category.title), // Вывод заголовка категории
        const SizedBox(height: 25), // Пробел между заголовком и списком лекций
        ListWidget(
          namel: category.title,
          lecturesData: category.lectures, // Теперь тип совпадает
          onItemSelected: (Lecture selectedLecture) {
            context.read<TopicProvider>().selectLecture(selectedLecture);
            Navigator.pushNamed(context, '/lth');
          },
        ),

        const SizedBox(height: 25), // Пробел между категориями
      ],
    );
  }
}
