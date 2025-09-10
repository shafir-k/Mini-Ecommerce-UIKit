import 'package:flutter/material.dart';

class SnackBarManager {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Show success snackbar
  static void showSuccessSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.green,
      duration: duration,
      action: action,
    );
  }

  // Show error snackbar
  static void showErrorSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      duration: duration,
      action: action,
    );
  }

  // Private method to show snackbar
  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    if (scaffoldMessengerKey.currentContext != null) {
      scaffoldMessengerKey.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: backgroundColor,
            duration: duration,
            action: action,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
    }
  }
}
