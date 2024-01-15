import 'package:flutter/material.dart';
import 'package:my_ui3/pages/HomePage.dart';
import 'package:my_ui3/pages/IntroPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
      routes: {
        HomePage.id:(context) => HomePage(),
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}
