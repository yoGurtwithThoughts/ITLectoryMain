import 'package:flutter/material.dart';
import 'package:itlectory4/core/theme_lection.dart';

class TopicProvider with ChangeNotifier {
  Lecture? _selectedLecture;

  Lecture? get selectedLecture => _selectedLecture;

  void selectLecture(Lecture lecture) {
    _selectedLecture = lecture;
    notifyListeners(); // Уведомляем слушателей об изменении
  }

  void resetSelection() {
    _selectedLecture = null;
    notifyListeners();
  }
}