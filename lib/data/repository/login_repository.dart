import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/api.dart";
import "package:keole/data/models/models.dart";
import "package:keole/data/repository/repository.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/view_model/view_model.dart";

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
