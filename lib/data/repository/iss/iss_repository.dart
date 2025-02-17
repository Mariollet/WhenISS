import "dart:convert";
import "package:wheniss/data/models/iss_location.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/models/iss_visibility.dart";
import "package:wheniss/ui/view_model/index.dart";
import "package:http/http.dart";

final issLocationRepository = FutureProvider.autoDispose<void>((ref) async {
  final Client client = Client();
  final Uri url = Uri.http("api.open-notify.org", "/iss-now.json");

  try {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final IssLocation issLocation = IssLocation.fromJson(data);

      ref.read(issLocationProvider.notifier).state = issLocation;
    } else {
      throw Exception("Failed to load ISS location");
    }
  } on ClientException catch (error) {
    if (error.message == "XMLHttpRequest error.") {
      throw Exception('t null');
    }
  }
});

final issVisibilityRepository = FutureProvider.autoDispose<void>((ref) async {
  final Client client = Client();
  final Uri url = Uri.https("somapps.fr", "/WhenISS/when_iss_data.php");

  try {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      final List<IssVisibility> issVisibility = IssVisibility.fromJsonList(data);

      ref.read(issVisibilityProvider.notifier).state = issVisibility;
    } else {
      throw Exception("Failed to load ISS data");
    }
  } on ClientException catch (error) {
    if (error.message == "XMLHttpRequest error.") {
      throw Exception(error);
    }
  }
});
