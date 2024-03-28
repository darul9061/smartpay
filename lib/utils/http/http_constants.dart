class HttpQueryUrlConstant {
  static String nameQuery = "";
}

class HttpConstants {

  static String protocol = "https://";

  static const String devBaseUrl = "lpdosubi.com";

  static const String baseUrl = "www.smartpay.com";

  static String terms = "/terms";

  static String policy = "/policy";

  static String login = "/api/UsersAuths/Login/";

  static String signup = "/api/UsersAuths/";

  static String signupVerif = "/api/UsersAuths/VerifyEmail/";

  static String resendVerifCode = "/api/UsersAuths/ResendOTP/";

  static String forgotPasswordVerifyToken = "/api/UsersAuths/ResetPasswordTokenVerify/";

  static String forgotPasswordReset = "/api/UsersAuths/ResetPassword/";

  static String forgotPasswordSendOTP = "/api/UsersAuths/SendPasswordOTP/";

  static String refreshToken = "/api/UsersAuths/token/refresh/";

  static String storeAndGetPatient = "/api/Patients/";

  static String storeNextOfKin(String patientId) => "/api/Patients/$patientId/next-of-kin/";

  static String editNextOfKin(String patientId, dataId) => "/api/Patients/$patientId/next-of-kin/$dataId/";

  static String pharmacy = "/api/pharmacy/";

  static String pharmacyAddToCart (String patientId) => "/api/Patients/$patientId/pharmacy-cart/AddUpdateCartItem/";

  static const String practitioners = "/api/Practitioners/";

  static String practitionerDetail(String practionerId) => "/api/Practitioners/$practionerId/";

  static String patientAppointment(String patientId) => "/api/Patients/$patientId/patient-appointment/";

  static String practitionerReview(String patientId) => "/api/Patients/$patientId/patient-review/";

  static String patientInfo(String patientId) => "/api/Patients/$patientId/";

  static const String labTests = "/api/laboratory/";

  static const String labTestsDates = "/api/laboratory/available-dates/";

  static String getLabTestCartItems(String patientId) => "/api/Patients/$patientId/test-cart/ListCart/";

  static String getMedicineCartItems(String patientId) => "/api/Patients/$patientId/pharmacy-cart/ListCart/";

  static String addLabTestToCart(String patientId) => "/api/Patients/$patientId/test-cart/AddUpdateCartItem/";

  static String createAppointment(String patientId) => "/api/Patients/$patientId/patient-appointment/";

  static String createdOrder(String patientId) => "/api/Patients/$patientId/orders/CreateOrder/";

  static String removeItemInLabTestCart(String patientId, String cartId, String itemId) => "/api/Patients/$patientId/test-cart/$cartId/test-cart-items/$itemId/RemoveCartItem/";

  static String removeItemInPharmacyCart(String patientId, String cartId, String itemId) => "/api/Patients/$patientId/pharmacy-cart/$cartId/pharmacy-cart-items/$itemId/RemoveCartItem/";

  static String patientPatientPayment(String patientId) => "/api/Patients/$patientId/patient-payment/";
  
  static String patientWalletBalance(String patientId) => "/api/Patients/$patientId/patient-wallet/";
  
  static String testResults(String patientId) => "/api/Patients/$patientId/test-results/";
  
  static String addNewTrack(String patientId) => "/api/Patients/$patientId/self-tracker/AddUpdateTrackerData/";
  
  static String getSelfTracks(String patientId) => "/api/Patients/$patientId/self-tracker/ListTracker/";
  
  static String deleteSelfTracker(String patientId, String selfTrackerid) => "/api/Patients/$patientId/self-tracker/$selfTrackerid/DeleteTracker/";
  
  static String agoraGenerateToken(String userId) => "/api/UsersAuths/$userId/AuthenticateAgora/";
  
  static String flutterWaveVerifyTrans(String transIdOrTransRef) => "api.flutterwave.com/v3/transactions/$transIdOrTransRef/verify";

  static const String getSubPlans = "/api/payments/plans/";
  
  static String freeChangPlan(String patientId) => "/api/Patients/$patientId/plans/ChangePlan/";
  
}
