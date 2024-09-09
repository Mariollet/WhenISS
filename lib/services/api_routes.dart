abstract class ApiRoutes {
  // Security
  static const String login = "/api/login_check";
  static const String forgotPassword = "/api/security/forgot-password";

  // User
  static const String getUser = "/api/member";
  static const String patchUser = "/api/profile/patch";
}
