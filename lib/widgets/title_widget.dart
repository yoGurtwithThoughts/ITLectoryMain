import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlectory4/widgets/style_text.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/PlayLabel.svg',
          height: 25,
          width: 25,
        ),
        const SizedBox(width: 25), // Отступ между SVG и текстом
        Expanded( // Оборачиваем Text в Expanded
          child: Text(
            title,
            style: TextStylesMain.alltxt,
            softWrap: true, // Разрешаем перенос текста
            maxLines: 3, // Ограничиваем количество строк
            overflow: TextOverflow.ellipsis, // Добавляем обрезку при необходимости
          ),
        ),
      ],
    );
  }
}
