import "dart:async";
import "dart:convert";
import "dart:io";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";

abstract class Api {
  static final Client client = Client();
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  static final String baseUrl = env["APP_BASE_URL"];
  static String? token;

  // TODO: remove
  static Future<Map<String, dynamic>> authenticate(
      Map<String, dynamic> body) async {
    try {
      final Response response = await client.post(
        Uri.https(baseUrl, ApiRoutes.login),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return {
          "success": false,
          "message": body["message"] ?? "Une erreur inconnue est survenue.",
        };
      }

      await secureStorage.write(key: "token", value: token = body["token"]);

      return {
        "success": true,
        "message": '',
      };
    } on ClientException {
      return {
        "success": false,
        "message": "Une erreur est survenue : serveur inaccessible.",
      };
    }
  }

  static Future<dynamic> send({
    required dynamic method,
    required String endpoint,
    required bool authorizationHeader,
    Object? body,
  }) async {
    try {
      final Response response = await method(
        Uri.https(baseUrl, endpoint),
        headers: {
          if (authorizationHeader)
            HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

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
      await send(
        method: client.get,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
      );

  static Future<dynamic> post(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await send(
        method: client.post,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> patch(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await send(
        method: client.patch,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );

  static Future<dynamic> delete(
    String endpoint, {
    required Object? body,
    bool authorizationHeader = true,
  }) async =>
      await send(
        method: client.delete,
        endpoint: endpoint,
        authorizationHeader: authorizationHeader,
        body: body,
      );
}
