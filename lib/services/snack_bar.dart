import "package:flutter/material.dart";
import "package:keole/services/services.dart";

void showSnackBar(String message) {
  final SnackBar snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 6),
  );

  ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
}
