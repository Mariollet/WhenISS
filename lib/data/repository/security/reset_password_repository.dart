import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:studiokg/data/api.dart";
import "package:studiokg/services/index.dart";

final postResetPasswordRepository =
    FutureProvider.autoDispose.family<void, String>(
  (_, email) async {
    final response = await Api.post(
      ApiRoutes.forgotPassword,
      body: {
        "email": email,
      },
      authorizationHeader: false,
    );

    if (response["success"] == false) throw Exception(response["message"]);
  },
);
