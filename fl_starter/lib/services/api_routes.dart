class AppApi {
  // Base URLs
  static const String baseUrlLocal = "127.0.0.1:8000";
  static const String baseUrlLocalMac = "192.168.10.129:8000";
  static const String baseUrlDev = "inst-starter.abtel.fr";
  static const String baseUrlProd = "starter.app";

  // Security
  static const String loginCheck = "/api/login_check";
  static const String forgotPassword = "/api/security/forgot-password";

  // Customer
  static String getCustomer(int customerId) => "/api/customer/$customerId/get";
  static const String postNewCustomer = "/api/customer/new";
  static String patchValidateNewCustomer(int customerId) =>
      "/api/customer/$customerId/validate";
}
