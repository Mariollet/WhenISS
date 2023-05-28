import "package:envied/envied.dart";

part "env.g.dart";

@Envied(path: ".env")
abstract class BaseEnvironment {
  @EnviedField(varName: "APP_NAME")
  static const String appName = _BaseEnvironment.appName;

  @EnviedField(varName: "APP_LOCALE")
  static const String appLocale = _BaseEnvironment.appLocale;

  @EnviedField(varName: "APP_HOME")
  static const String appHome = _BaseEnvironment.appHome;
}

@Envied(path: ".env.local")
abstract class Environment {
  static const String appName = _BaseEnvironment.appName;
  static const String appLocale = _BaseEnvironment.appLocale;
  static const String appHome = _BaseEnvironment.appHome;

  @EnviedField(varName: "APP_BASE_URL")
  static const String appBaseUrl = _Environment.appBaseUrl;

  @EnviedField(varName: "APP_DEBUG_EMAIL")
  static const String appDebugEmail = _Environment.appDebugEmail;

  @EnviedField(varName: "APP_DEBUG_PASSWORD")
  static const String appDebugPassword = _Environment.appDebugPassword;
}
