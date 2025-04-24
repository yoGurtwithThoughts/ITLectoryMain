

import 'package:itlectory4/core/lection_theme_data.dart';

class Lecture {
  final String title;
  final String content;

  Lecture({required this.title, required this.content});
}

class Category {
  final String title;
  final List<Lecture> lectures;

  Category({required this.title, required this.lectures});
}

final List<Category> categories = [
  Category(
    title: 'Введение в WPF',
    lectures: StartWPF.map((title) => Lecture(title: title, content: "")).toList(),
  ),
  Category(
    title: 'Язык разметки XAML',
    lectures: XAMLStart.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Элементы управления',
    lectures: ControlsElement.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Рисование и 2D графика',
    lectures: Draving.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Анимация',
    lectures: Dravingg.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Стили и шаблоны',
    lectures: Dravinggg.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Основы событий',
    lectures: RMVVM.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Паттерн MVVM',
    lectures: RMVVMM.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Команды и взаимодействие с пользователем',
    lectures: RMVVMMM.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Работа с мультимедиа',
    lectures: WPFV.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Документы и печать',
    lectures: WPFVc.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
  Category(
    title: 'Оптимизация и производительность',
    lectures: WPFVcc.map((title) => Lecture(title: title, content: '...')).toList(),
  ),
];