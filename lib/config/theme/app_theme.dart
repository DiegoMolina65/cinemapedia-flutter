import 'package:flutter/material.dart';

class AppTheme {
  final bool isDarkmode;

  AppTheme({
    this.isDarkmode = false,
  });

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: Colors.white,
      );

  AppTheme copyWith({bool? isDarkmode}) => AppTheme(
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
