import "package:context_holder/context_holder.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final appErrorProvider = Provider<AppError>((ref) => AppError());

class AppError {
  void showSnackBarError() {
    const snackBar = SnackBar(
      content: Text("Une erreur est survenue."),
    );

    // Find the ScaffoldMessenger in the widget tree and use it to show the snackbar.
    ScaffoldMessenger.of(ContextHolder.currentContext).showSnackBar(snackBar);
  }
}
