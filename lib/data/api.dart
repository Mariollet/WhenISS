import "dart:async";
import "dart:convert";
import "dart:io";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";

abstract class Api {
  static const String baseUrl = Environment.appBaseUrl;
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  static final Client client = Client();
  static String? token;

  static Future<dynamic> _send({
    required ApiMethod method,
    required String endpoint,
    required bool authorizationHeader,
    Object? body,
  }) async {
    if (method != ApiMethod.get) body = jsonEncode(body);
    if (authorizationHeader) token = await secureStorage.read(key: "token");

    final Uri url = Uri.https(baseUrl, endpoint);
    final Map<String, String> headers = {
      if (authorizationHeader) HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    final Response response;

    try {
      switch (method) {
        case ApiMethod.get:
          response = await client.get(url, headers: headers);

          break;
        case ApiMethod.post:
          response = await client.post(url, headers: headers, body: body);

          break;
        case ApiMethod.patch:
          response = await client.patch(url, headers: headers, body: body);

          break;
        case ApiMethod.delete:
          response = await client.delete(url, headers: headers, body: body);

          break;
      }

      return jsonDecode(response.body);
    } on ClientException catch (error) {
      if (error.message == "XMLHttpRequest error.") {
        throw Exception(localizations.errorUnreachableServer);
      }

      rethrow;
    }
  }

  static Future<dynamic> get(
    String endpoint, {
    bool authorizationHeader = true,
  }) async =>
      await _send(
        method: ApiMethod.get,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
      );

  static Future<dynamic> post(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await _send(
        method: ApiMethod.post,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> patch(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await _send(
        method: ApiMethod.patch,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> delete(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await _send(
        method: ApiMethod.delete,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );
}

enum ApiMethod {
  get,
  post,
  patch,
  delete,
}
