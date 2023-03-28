import "package:keole/env.local.dart";

final Map<String, dynamic> env = {
  "APP_NAME": "Keole",
  "APP_BASE_URL": null,
  "APP_HOME": '/',
  // "APP_DEBUG": false,
  // "BASE_URL_LOCAL": "localhost:8000",
  // `ifconfig | grep 192` to get the current local Mac IP
  // "BASE_URL_LOCAL_MAC_IP": "192.168.10.___:8000",
  // "BASE_URL_PREPROD": "inst-via-learn.abtel.fr",
  // "BASE_URL_PROD": "________.app",
};

void setupEnvironment() => env.addAll(localEnv);
