import "dart:async";
import "dart:convert";
import "dart:io";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:keole/env.dart";
import "package:keole/services/services.dart";

const String unknownErrorMessage = "Une erreur inconnue est survenue.";

const Map<String, dynamic> clientErrorResponse = {
  "success": false,
  "message": "Une erreur est survenue : serveur inaccessible.",
};

abstract class API {
  static final Client client = Client();
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static final String baseUrl = env["APP_BASE_URL"]!;
  static String? token;

  static Future<String?> getToken() async => await storage.read(key: "token");

  static void showSnackBarError(Map<String, dynamic> body) =>
      showSnackBar(body["message"] ?? unknownErrorMessage);

  static Future<Map<String, dynamic>> authenticate(
      Map<String, dynamic> body) async {
    try {
      final Response response = await client.post(
        Uri.https(baseUrl, APIRoutes.loginCheck),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        return {
          "success": false,
          "message": body["message"] ?? unknownErrorMessage,
        };
      }

      await storage.write(key: "token", value: token = body["token"]);

      return {
        "success": true,
        "message": '',
      };
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future get(String endpoint) async {
    token ??= await getToken();

    try {
      final Response response = await client.get(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(responseBody);

      return responseBody;
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future post(String endpoint, Map<String, dynamic> body,
      [bool includeToken = true]) async {
    token ??= await getToken();

    try {
      final Response response = await client.post(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.authorizationHeader: includeToken ? "Bearer $token" : '',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(responseBody);

      return responseBody;
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future patch(String endpoint, Map<String, dynamic> body) async {
    token ??= await getToken();

    try {
      final Response response = await client.patch(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(responseBody);

      return responseBody;
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future delete(String endpoint, [Map<String, dynamic>? body]) async {
    token ??= await getToken();

    try {
      final Response response = await client.delete(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: body == null ? null : jsonEncode(body),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(responseBody);

      return responseBody;
    } on ClientException {
      return clientErrorResponse;
    }
  }
}
