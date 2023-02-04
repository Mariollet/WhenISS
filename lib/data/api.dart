import "dart:convert";
import "dart:io";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;
import "package:keole/services/api_routes.dart";
import "package:keole/services/snack_bar.dart";

final API api = API();

class API {
  static final String baseUrl = dotenv.env["BASE_URL"]!;

  final String unknownErrorMessage = "Une erreur est survenue.";

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token;

  Future<void> getToken() async => token ??= await storage.read(key: "token");

  String getResponseErrorMessage(Map<String, dynamic> response) =>
      response["message"] ?? unknownErrorMessage;

  Future<String> authenticate(Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.https(baseUrl, APIRoutes.loginCheck),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(body),
    );

    body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final String message = body["message"] ?? unknownErrorMessage;

      showSnackBar(message);

      return message;
    }

    token = body["token"];

    await storage.write(key: "token", value: token);

    return "true";
  }

  Future get(String endpoint) async {
    await getToken();

    final response = await http.get(
      Uri.https(baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );

    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final String message = getResponseErrorMessage(body);

      showSnackBar(message);

      return;
    }

    return body;
  }

  Future post(String endpoint, Map<String, dynamic> body,
      [bool includeToken = true]) async {
    // token ??= await storage.read(key: "token");

    final response = await http.post(
      Uri.https(baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: includeToken ? "Bearer $token" : '',
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(body),
    );

    body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      showSnackBar("todo");

      return;
    }

    return body;
  }

  Future patch(String endpoint, Map<String, dynamic> body) async {
    // token ??= await storage.read(key: "token");

    final response = await http.patch(
      Uri.https(baseUrl, endpoint),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonEncode(body),
    );

    body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      // appError.showSnackBarError();

      return;
    }

    return body;
  }
}
