import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message, {bool success = true}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: success ? Colors.green : Colors.red,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(16),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
