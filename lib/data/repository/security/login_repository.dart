import "dart:convert";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/index.dart";
import "package:keole/data/repository/index.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/view_model/index.dart";

final postLoginRepository = FutureProvider.autoDispose
    .family<void, Map<String, dynamic>>((ref, credentials) async {
  final response = await Api.post(
    ApiRoutes.login,
    body: jsonEncode(credentials),
  );

  if (response is Exception) throw response;

  final String jwt = response["token"];
  await ref.read(writeTokenProvider(jwt).future);

  final User user = await ref.read(getUserRepository.future);
  ref.read(userProvider.notifier).state = user;
});
