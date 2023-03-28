abstract class APIRoutes {
  // Security
  static const String loginCheck = "/api/login_check";
  static const String forgotPassword = "/api/security/forgot-password";

  // Customer
  static const String getCustomer = "/api/customer";
  static String patchCustomer(int customerId) => "/api/customer/$customerId";
}
