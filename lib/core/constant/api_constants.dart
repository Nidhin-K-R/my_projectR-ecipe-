class ApiConstants {
  // dummy recipies
  static const String baseUrl = "https://dummyjson.com";
  static const String urlEndPoint = "recipes";
  // user registration
  static const String regUserUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU";
  // headers
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  // user login
  static const String loginUserUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU";
  // new password (oob code)
  static const String oobCodeUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU";
}
