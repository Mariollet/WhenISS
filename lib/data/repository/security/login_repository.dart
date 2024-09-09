import "package:fl_starter/env.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/data/api.dart";
import "package:fl_starter/data/models/index.dart";
import "package:fl_starter/data/repository/index.dart";
import "package:fl_starter/services/index.dart";
import "package:fl_starter/ui/view_model/index.dart";

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
