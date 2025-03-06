import 'package:flutter/material.dart';

class SnackBarHelper {
  static bool _isSnackBarShown = false;

  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration cooldown = const Duration(seconds: 2), 
  }) {
    if (!_isSnackBarShown) {
      _isSnackBarShown = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      Future.delayed(cooldown, () {
        _isSnackBarShown = false;
      });
    }
  }
}
