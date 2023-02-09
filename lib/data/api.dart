import "dart:async";
import "dart:convert";
import "dart:io";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart";
import "package:keole/services/api_routes.dart";
import "package:keole/services/snack_bar.dart";

const String unknownErrorMessage = "Une erreur inconnue est survenue.";

const Map<String, dynamic> clientExceptionResponse = {
  "success": false,
  "message": "Une erreur est survenue (0x01).",
};

// TODO: abstract API?
final API api = API();

class API {
  final Client client = Client();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final String baseUrl = dotenv.env["APP_BASE_URL"]!;
  String? token;

  Future authenticate(Map<String, dynamic> body) async {
    try {
      final Response response = await client.post(
        Uri.https(baseUrl, APIRoutes.loginCheck),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: '*',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      body = jsonDecode(response.body);

      if (response.statusCode != 200) {
        showSnackBarError(body);

        return body["message"] ?? unknownErrorMessage;
      }

      await storage.write(key: "token", value: token = body["token"]);

      return true;
    } on ClientException {
      return clientExceptionResponse;
    }
  }

  Future get(String endpoint) async {
    try {
      final Response response = await client.get(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: '*',
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      final Map<String, dynamic> body = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(body);

      return body;
    } on ClientException {
      return clientExceptionResponse;
    }
  }

  Future post(String endpoint, Map<String, dynamic> body,
      [bool includeToken = true, bool verbose = false]) async {
    try {
      final Response response = await client.post(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: '*',
          HttpHeaders.authorizationHeader: includeToken ? "Bearer $token" : '',
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      body = jsonDecode(response.body);

      if (response.statusCode != 200 && verbose) showSnackBarError(body);

      return body;
    } on ClientException {
      return clientExceptionResponse;
    }
  }

  Future patch(String endpoint, Map<String, dynamic> body) async {
    try {
      final Response response = await client.patch(
        Uri.https(baseUrl, endpoint),
        headers: {
          HttpHeaders.accessControlAllowOriginHeader: '*',
          HttpHeaders.authorizationHeader: "Bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(body),
      );

      body = jsonDecode(response.body);

      if (response.statusCode != 200) showSnackBarError(body);

      return body;
    } on ClientException {
      return clientExceptionResponse;
    }
  }

  void showSnackBarError(Map<String, dynamic> body) =>
      showSnackBar(body["message"] ?? unknownErrorMessage);
}
