class BaseURL {
  /// Base URL of the localhost site.
  static const String local = "localhost:8000";

  /// Base URL of the Mac localhost site.
  /// Type `ifconfig | grep 192` on the Mac to get its current local IP.
  static const String localMac = "192.168.10.___:8000";

  /// Base URL of the pre-production site.
  static const String preprod = "inst-_____.abtel.fr";

  /// Base URL of the production site.
  static const String prod = "_____.app";
}

class APIRoutes {
  // Security
  static const String loginCheck = "/api/login_check";
  static const String forgotPassword = "/api/security/forgot-password";

  // Customer
  static String getCustomer(int customerId) => "/api/customer/$customerId/get";
  static const String postNewCustomer = "/api/customer/new";
  static String patchValidateNewCustomer(int customerId) =>
      "/api/customer/$customerId/validate";
}
