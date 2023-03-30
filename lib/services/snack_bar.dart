import "package:flutter/material.dart";
import "package:keole/services/services.dart";

// TODO: rework snack bar
void showSnackBar(String message) =>
    ScaffoldMessenger.of(currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
