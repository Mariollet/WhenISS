import "package:context_holder/context_holder.dart";
import "package:flutter/material.dart";

void showSnackBar(String message) {
  final SnackBar snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 6),
  );

  ScaffoldMessenger.of(ContextHolder.currentContext).showSnackBar(snackBar);
}
