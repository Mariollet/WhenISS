import "dart:convert";
import "dart:io";
import "package:fl_starter/services/api_routes.dart";
import 'package:fl_starter/services/app_error.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;

final apiProvider = StateNotifierProvider<ApiNotifier, Api>((ref) {
  final AppError appError = ref.read(appErrorProvider);

  return ApiNotifier(appError: appError);
});

class ApiNotifier extends StateNotifier<Api> {
  final AppError appError;

  ApiNotifier({
    required this.appError,
  }) : super(Api(appError: appError));
}

class Api {
  /// This is the current base URL for the API.
  /// You can select one from the [AppApi] module.
  static const String baseUrl = AppApi.baseUrlLocal;

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AppError appError;
  String? token;

  Api({
    required this.appError,
  });

  Future<String> getToken(Map<String, dynamic> parameters) async {
    final response = await http.post(
      Uri.https(Api.baseUrl, AppApi.loginCheck),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: json.encode(parameters),
    );

    if (response.statusCode != 200) {
      appError.showSnackBarError();

      return jsonDecode(response.body)["message"];
    }

    // Save token
    token = jsonDecode(response.body)["token"];

    await storage.write(
      key: "token",
      value: token,
    );

    return "true";
  }

  Future<dynamic> get(String endpoint) async {
    token ??= await storage.read(key: "token");

    final response = await http.get(
      Uri.https(Api.baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    if (response.statusCode == 200) return jsonDecode(response.body);

    appError.showSnackBarError();
  }

  Future<dynamic> post(
      String endpoint, Map<String, dynamic> params, bool hasToken) async {
    token ??= await storage.read(key: "token");

    final response = await http.post(
      Uri.https(Api.baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: hasToken ? "Bearer $token" : '',
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: json.encode(params),
    );

    if (response.statusCode != 200) appError.showSnackBarError();

    return jsonDecode(response.body);
  }

  Future<dynamic> patch(String endpoint, Map<String, dynamic> params) async {
    token ??= await storage.read(key: "token");

    final response = await http.patch(
      Uri.https(Api.baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: json.encode(params),
    );

    if (response.statusCode != 200) appError.showSnackBarError();

    return jsonDecode(response.body);
  }
}
