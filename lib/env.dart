import "package:keole/env.local.dart";

abstract class Environment {
  static void initialize() => env.addAll(localEnv);
}

final Map<String, dynamic> env = {
  "APP_NAME": "Keole",
  "APP_LOCALE": "fr",
  "APP_HOME": null,
  "APP_BASE_URL": null,
  "APP_DEBUG_EMAIL": null,
  "APP_DEBUG_PASSWORD": null,
};
