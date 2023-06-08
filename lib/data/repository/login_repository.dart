import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/index.dart";
import "package:keole/data/repository/index.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/view_model/index.dart";

final postLoginRepository =
    FutureProvider.autoDispose.family<void, Map<String, dynamic>>(
  (ref, credentials) async {
    final response = await Api.post(
      ApiRoutes.login,
      body: credentials,
      authorizationHeader: false,
    );

    if (response["code"] == 401) throw Exception(response["message"]);

    await ref.read(writeTokenProvider(response["token"]).future);

    final User user = await ref.read(getUserRepository.future);

    ref.read(userProvider.notifier).state = user;
  },
);
