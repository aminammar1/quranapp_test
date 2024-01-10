import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_holy_quran/screens/singup.dart';
import 'package:the_holy_quran/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const signup(),
        '/splash': (context) => SplashScreen(),
      },
    );
  }
}
