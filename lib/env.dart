// import "package:keole/env.local.dart";
import "package:keole/services/services.dart";

// ignore: undefined_identifier
void setupEnvironment() => env.addAll(localEnv);

final Map<String, dynamic> env = {
  "APP_NAME": "Keole",
  "APP_LOCALE": "fr",
  "APP_HOME": AppRoutes.home,
  "APP_BASE_URL": null,
  "APP_DEBUG_EMAIL": null,
  "APP_DEBUG_PASSWORD": null,
};
