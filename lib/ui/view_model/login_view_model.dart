import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/data/repository/login_repository.dart";

final loginProvider = Provider.autoDispose.family<Future, Map<String, dynamic>>(
    (ref, request) => ref.watch(loginRepository(request).future));

final isLoggedProvider = Provider.autoDispose<bool>((ref) {
  final AsyncValue<bool> response = ref.watch(getTokenRepository);

  return response.when(
    data: (bool isLogged) => isLogged,
    error: (error, _) => throw Exception(error),
    loading: () => false,
  );
});

final clearSecureStorageProvider = Provider.autoDispose<bool>((ref) {
  final AsyncValue<bool> response = ref.watch(clearSecureStorageRepository);

  return response.when(
    data: (bool done) => done,
    error: (error, _) => throw Exception(error),
    loading: () => false,
  );
});

/* final hasLoginTokenViewModelProvider =
    StateNotifierProvider<CheckTokenLoginViewModelNotifier, bool?>((ref) {
  final AsyncValue<bool> checkToken = ref.watch(checkTokenRepositoryProvider);

  return CheckTokenLoginViewModelNotifier(
    checkToken: checkToken,
  );
});

class CheckTokenLoginViewModelNotifier extends StateNotifier<bool?> {
  final AsyncValue<bool> checkToken;

  CheckTokenLoginViewModelNotifier({
    required this.checkToken,
  }) : super(null) {
    checkToken.when(
      loading: () {},
      error: (error, stack) => throw Exception("An error occurred: $error"),
      data: (response) => setCheckLogin(response),
    );
  }

  void setCheckLogin(bool value) => state = value;
}

final getLoginErrorViewModelProvider = StateNotifierProvider.autoDispose
    .family<GetLoginViewModelNotifier, String?, Map<String, dynamic>>(
        (ref, credentials) {
  final AsyncValue<String?> token =
      ref.watch(getTokenRepositoryProvider(credentials));

  return GetLoginViewModelNotifier(
    token: token,
  );
});

class GetLoginViewModelNotifier extends StateNotifier<String?> {
  final AsyncValue<String?> token;

  GetLoginViewModelNotifier({
    required this.token,
  }) : super(null) {
    token.when(
      loading: () {},
      error: (error, stack) => setError("An error occurred: $error"),
      data: (response) => setError(response),
    );
  }

  void setError(String? error) => state = error;
}

final hasResetPasswordErrorViewModelProvider = StateNotifierProvider.autoDispose
    .family<ResetPasswordViewModelNotifier, String?, String>((ref, email) {
  final AsyncValue<Map<String, dynamic>?> forgotPassword =
      ref.watch(forgotPasswordRepositoryProvider(email));

  return ResetPasswordViewModelNotifier(
    forgotPassword: forgotPassword,
  );
});

class ResetPasswordViewModelNotifier extends StateNotifier<String?> {
  final AsyncValue<Map<String, dynamic>?> forgotPassword;

  ResetPasswordViewModelNotifier({
    required this.forgotPassword,
  }) : super(null) {
    forgotPassword.when(
      loading: () {},
      error: (error, stack) => setError("An error occurred: $error"),
      data: (response) => setError(response.toString()),
    );
  }

  void setError(String error) => state = error;
} */