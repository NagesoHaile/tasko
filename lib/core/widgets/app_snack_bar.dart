import 'package:flutter/material.dart';

class AppSnackBar {
  static showAppSnackBar({
    required BuildContext context,
    required String message,
    Color color = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              color: color,
              fontSize: 16,
            ),
          ),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
