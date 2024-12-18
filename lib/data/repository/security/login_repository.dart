import "package:wheniss/env.dart";
import "package:wheniss/ui/view_model/user_view_model%20copy.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/api.dart";
import "package:wheniss/data/models/index.dart";
import "package:wheniss/data/repository/index.dart";
import "package:wheniss/services/index.dart";
import "package:wheniss/ui/view_model/index.dart";

final postLoginRepository = FutureProvider.autoDispose
    .family<void, Map<String, dynamic>>((ref, credentials) async {
  final response = await Api.post(
    ApiRoutes.login,
    body: credentials,
    authorizationHeader: false,
  );

  if (response is Exception || response["code"] == 401) {
    throw Exception(response["message"]);
  }

  final String jwt = Environment.appDebug == false ? response["token"] : "JW7D38U670K3N";
  await ref.read(writeTokenProvider(jwt).future);

  final User user = await ref.read(getUserRepository.future);
  ref.read(userProvider.notifier).state = user;
});
