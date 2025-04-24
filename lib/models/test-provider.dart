import 'package:flutter/material.dart';
import 'package:itlectory4/core/test-infomation-data.dart';// Убедитесь, что путь правильный

class TestProvider with ChangeNotifier {
  String? selectedTitle; // Хранит заголовок выбранного теста
  List<Test>? selectedTests;
   // Хранит список вопросов выбранного теста

  // Метод для выбора теста
 void selectTest(String title, List<Test> tests) {
  selectedTitle = title;
  selectedTests = tests;
  notifyListeners();
}

// Добавьте эти переменные в WpfTestProvider


  // Метод для сброса выбранного теста
  void resetSelection() {
    selectedTitle = null; // Сбрасываем заголовок
    selectedTests = null; // Сбрасываем список вопросов
    notifyListeners(); // Уведомляем слушателей об изменении состояния
  }
}

