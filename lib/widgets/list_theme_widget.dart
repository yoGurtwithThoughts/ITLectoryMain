import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itlectory4/core/theme_lection.dart';

class ListWidget extends StatelessWidget {
  final String namel;
  final List<Lecture> lecturesData; // Теперь принимает List<Lecture>
  final Function(Lecture) onItemSelected;

  const ListWidget({
    super.key,
    required this.namel,
    required this.lecturesData,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(53, 51, 51, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.transparent),
          ),
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/images/bookclosed.svg',
                height: 35,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  namel,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
          trailing: SvgPicture.asset(
            'assets/images/chevrondown.svg',
            height: 20,
          ),
          children: lecturesData.map((lecture) {
            // Перебираем лекции
            return GestureDetector(
              onTap: () {
                onItemSelected(lecture); // Передаем выбранную лекцию
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2.5),
                padding: const EdgeInsets.all(10),
                height: 60,
                width: 340,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 33, 33, 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center( // Выравниваем текст лекции по центру
                  child: Text(
                    lecture.title, // Отображаем название лекции
                    textAlign: TextAlign.center, // Текст по центру
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    softWrap: true, // Включаем перенос текста
                    overflow: TextOverflow.fade, // Эффект при обрезании текста
                    maxLines: null, // Разрешаем неограниченное количество строк
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}