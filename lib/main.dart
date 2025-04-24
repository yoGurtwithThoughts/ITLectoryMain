import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itlectory4/core/test-infomation-data.dart';
import 'package:itlectory4/core/topic-provider.dart';
import 'package:itlectory4/models/test-provider.dart';
import 'package:itlectory4/pages/home_teachers.dart';
import 'package:itlectory4/pages/lecture-theme-page.dart';
import 'package:itlectory4/pages/onboard_1.dart';
import 'package:itlectory4/pages/page_register.dart';
import 'package:itlectory4/pages/profile_page.dart';
import 'package:itlectory4/pages/students.dart';
import 'package:itlectory4/pages/students/home-students.dart';
import 'package:itlectory4/pages/students/test-page.dart';
import 'package:itlectory4/service/net-status-checker.dart';
import 'package:itlectory4/service/network-check-page.dart';
import 'package:itlectory4/widgets/authrise_switch_widget.dart';
import 'package:itlectory4/widgets/btb_logik.dart';
import 'package:itlectory4/widgets/chats_page.dart';
import 'package:itlectory4/widgets/sign_up.dart';
import 'package:itlectory4/widgets/splash.dart';
import 'package:itlectory4/widgets/teacher_signIn.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  bool isConnected = await checkInitialConnectivity(); // Проверяем интернет

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TestProvider()),
      ChangeNotifierProvider(create: (context) => WpfTestProvider()),
      ChangeNotifierProvider(create: (context) => TopicProvider()),
    ],
    child: MyApp(isConnected: isConnected), // Передаем статус подключения
  ));
}

/// Функция для проверки наличия подключения к интернету
Future<bool> checkInitialConnectivity() async {
  try {
    List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();
    ConnectivityResult connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    final bool hasInternet =
        await InternetConnectionChecker.createInstance().hasConnection;
    return hasInternet;
  } catch (e) {
    debugPrint("Ошибка проверки сети: $e");
    return false;
  }
}

class MyApp extends StatelessWidget {
  final bool isConnected;

  const MyApp({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    return NetworkMonitor(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isConnected ? '/splash' : '/checknet',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/th': (context) => const THome(),
          '/onb1': (context) => const OnBoard1(),
          '/sg': (context) => const SignUpWidget(),
          '/pagt': (context) => const RegisterPage(),
          '/logs': (context) => const LoginWidget(),
          '/sgt': (context) => const TeacherIn(),
          '/chat': (context) => const ChatPage(),
          '/profile': (context) => const ProfilePage(),
          '/students': (context) => const StudentsPage(),
          '/thm': (context) => const THomeContent(),
          '/lth': (context) => const LectureThemePage(),
          '/shome': (context) => const SHome(),
          '/test': (context) => const TestPage(),
          '/checknet': (context) => const CheckNetWork(),
        },
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(0, 137, 201, 1),
          scaffoldBackgroundColor: const Color.fromRGBO(21, 21, 21, 1),
        ),
      ),
    );
  }
}
