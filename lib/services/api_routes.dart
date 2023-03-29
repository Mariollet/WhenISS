abstract class APIRoutes {
  // Security
  static const String loginCheck = "/api/login_check";
  static const String forgotPassword = "/api/security/forgot-password";

  // Customer
  static const String getUser = "/api/customer";
  static String patchUser(int userId) => "/api/customer/$userId";
}
