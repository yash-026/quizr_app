import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.grey[850]!,
    secondary: const Color.fromRGBO(117, 117, 117, 1),
    tertiary: Colors.blue[900]!,
  ),
);