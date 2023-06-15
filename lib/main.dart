import 'package:flutter/material.dart';
import 'package:quizr/splashscreen.dart';
import 'package:quizr/theme/darktheme.dart';
import 'package:quizr/theme/lighttheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const Splashscreen()
    );
  }
}


