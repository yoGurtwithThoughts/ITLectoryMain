import 'package:flutter/material.dart';

class Test {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;

  Test({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

class WpfTest {
  final String title;
  final List<Test> tests;

  WpfTest({
    required this.title,
    required this.tests,
  });
}

class WpfTestProvider with ChangeNotifier {
  final List<WpfTest> _wpfTests = [
    // Тест 1: История и развитие WPF
    WpfTest(
      title: "История и развитие WPF",
      tests: [
        Test(
          question: "Когда была представлена WPF?",
          answers: ["2000 год", "2006 год", "2010 год"],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какое основное преимущество WPF по сравнению с WinForms?",
          answers: [
            "Поддержка 3D-графики",
            "Отсутствие поддержки событий",
            "Невозможность работы с XAML"
          ],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой из следующих компонентов является частью WPF?",
          answers: ["Windows Forms", "XAML", "ASP.NET"],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какой из следующих элементов не является частью WPF?",
          answers: ["Button", "Label", "HTML"],
          correctAnswerIndex: 2,
        ),
        Test(
          question: "Какой язык используется для описания интерфейса в WPF?",
          answers: ["C#", "XAML", "HTML"],
          correctAnswerIndex: 1,
        ),
      ],
    ),

    // Тест 2: Архитектура WPF
    WpfTest(
      title: "Архитектура WPF",
      tests: [
        Test(
          question: "Какой из следующих слоев архитектуры WPF отвечает за визуализацию?",
          answers: ["Presentation Layer", "Data Layer", "Business Logic Layer"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой компонент отвечает за обработку событий в WPF?",
          answers: ["Dispatcher", "DataContext", "ViewModel"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Что такое Data Binding в WPF?",
          answers: [
            "Связывание данных между элементами управления и источниками данных",
            "Процесс создания пользовательского интерфейса",
            "Метод обработки событий"
          ],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой из следующих паттернов проектирования используется в WPF?",
          answers: ["MVC", "MVVM", "MVP"],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какой из следующих компонентов не является частью архитектуры WPF?",
          answers: ["XAML", "CLR", "HTML"],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    // Тест 3: Основные понятия XAML
    WpfTest(
      title: "Основные понятия XAML",
      tests: [
        Test(
          question: "Что такое XAML?",
          answers: [
            "Язык программирования",
            "Язык разметки для описания интерфейса",
            "Формат данных"
          ],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какой элемент используется для создания контейнера в XAML?",
          answers: ["Panel", "Container", "Box"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой атрибут используется для задания имени элемента в XAML?",
          answers: ["Name", "Id", "ElementName"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой элемент используется для создания текстового поля в XAML?",
          answers: ["TextBox", "TextField", "Input"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой из следующих элементов не является элементом управления в XAML?",
          answers: ["Button", "TextBlock", "String"],
          correctAnswerIndex: 2,
        ),
      ],
    ),

    // Тест 4: Базовые компановщики
    WpfTest(
      title: "Базовые компановщики",
      tests: [
        Test(
          question: "Какой компоновщик располагает элементы по вертикали?",
          answers: ["StackPanel", "Grid", "WrapPanel"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой компоновщик используется для создания сетки?",
          answers: ["StackPanel", "Grid", "Canvas"],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какой из следующих компоновщиков позволяет размещать элементы в строках и столбцах?",
          answers: ["StackPanel", "Grid", "WrapPanel"],
          correctAnswerIndex: 1,
        ),
        Test(
          question: "Какой компоновщик используется для наложения элементов друг на друга?",
          answers: ["Canvas", "StackPanel", "Grid"],
          correctAnswerIndex: 0,
        ),
        Test(
          question: "Какой компоновщик автоматически изменяет размер элементов в зависимости от доступного пространства?",
          answers: ["WrapPanel", "StackPanel", "Grid"],
          correctAnswerIndex: 0,
        ),
      ],
    ),
  ];

    List<WpfTest> get wpfTests => _wpfTests;

  WpfTest? selectedTest;

  void selectTest(String title, List<Test> tests) {
    selectedTest = WpfTest(title: title, tests: tests);
    notifyListeners();
  }
}