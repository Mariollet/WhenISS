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
