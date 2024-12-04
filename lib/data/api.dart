import "dart:async";
import "dart:convert";
import "dart:io";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:fl_starter/env.dart";
import "package:fl_starter/services/index.dart";

abstract class Api {
  static const String baseUrl = Environment.appBaseUrl;
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  static final Client client = Client();
  static String? token;

  static Future<dynamic> _send({
    required final _ApiMethod method,
    required final String endpoint,
    required final bool authorizationHeader,
    Object? body,
  }) async {
    if (method != _ApiMethod.get) body = jsonEncode(body);
    if (authorizationHeader) token = await secureStorage.read(key: "token");

    // TODO: Fix token invalidation

    final Uri url = Uri.https(baseUrl, endpoint);
    final Map<String, String> headers = {
      if (authorizationHeader) HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    final Response response;

    try {
      if (Environment.appDebug) {
        return true;
      }
      switch (method) {
        case _ApiMethod.get:
          response = await client.get(url, headers: headers);

          break;
        case _ApiMethod.post:
          response = await client.post(url, headers: headers, body: body);

          break;
        case _ApiMethod.patch:
          response = await client.patch(url, headers: headers, body: body);

          break;
        case _ApiMethod.delete:
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
    final String endpoint, {
    final bool authorizationHeader = true,
  }) async =>
      await _send(
        method: _ApiMethod.get,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
      );

  static Future<dynamic> post(
    final String endpoint, {
    required final Object? body,
    final bool authorizationHeader = true,
  }) async =>
      await _send(
        method: _ApiMethod.post,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> patch(
    final String endpoint, {
    required final Object? body,
    final bool authorizationHeader = true,
  }) async =>
      await _send(
        method: _ApiMethod.patch,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> delete(
    final String endpoint, {
    required final Object? body,
    final bool authorizationHeader = true,
  }) async =>
      await _send(
        method: _ApiMethod.delete,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );
}

enum _ApiMethod {
  get,
  post,
  patch,
  delete,
}
