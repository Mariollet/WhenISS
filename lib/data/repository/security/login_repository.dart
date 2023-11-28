import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:studiokg/data/api.dart";
import "package:studiokg/data/models/index.dart";
import "package:studiokg/data/repository/index.dart";
import "package:studiokg/services/index.dart";
import "package:studiokg/ui/view_model/index.dart";

final postLoginRepository = FutureProvider.autoDispose
    .family<void, Map<String, dynamic>>((ref, credentials) async {
  final response = await Api.post(
    ApiRoutes.login,
    body: credentials,
  );

  if (response is Exception) throw response;

  final String jwt = response["token"];
  await ref.read(writeTokenProvider(jwt).future);

  final User user = await ref.read(getUserRepository.future);
  ref.read(userProvider.notifier).state = user;
});
