import "dart:async";
import "dart:convert";
import "dart:io";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:keole/services/api_routes.dart";
import "package:keole/services/snack_bar.dart";

const String unknownErrorMessage = "Une erreur inconnue est survenue.";

const Map<String, dynamic> clientErrorResponse = {
  "success": false,
  "message": "Une erreur est survenue (0x01).",
};

abstract class API {
  static final Client client = Client();
  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static final String baseUrl = dotenv.env["APP_BASE_URL"]!;
  static String? token;

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

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(body);

      return body;
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future post(String endpoint, Map<String, dynamic> body,
      [bool includeToken = true, bool verbose = false]) async {
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

      body = jsonDecode(response.body);

      if (response.statusCode != 200 && verbose) showSnackBarError(body);

      return body;
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

      body = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(body);

      return body;
    } on ClientException {
      return clientErrorResponse;
    }
  }

  static Future<String?> getToken() async => await storage.read(key: "token");

  static void showSnackBarError(Map<String, dynamic> body) =>
      showSnackBar(body["message"] ?? unknownErrorMessage);
}
