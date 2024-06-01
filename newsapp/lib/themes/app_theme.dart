import 'package:flutter/material.dart';

ThemeData AppTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20),
    elevation: 0,
    
  ),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.orange,
    secondary: Colors.grey[500]!,
    tertiary: Colors.black,
    
  ),
);