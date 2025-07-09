import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/view/mainscreen.dart';

class AuthService {
  // register
  static Future<void> regUser(String email, String password) async {
    try {
      final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU",
      );
      final headers = {"Content-Type": "application/json"};
      final body = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print("Successfull");
      }
    } catch (e) {
      throw Exception("Error register: $e");
    }
  }

  // login
  static Future<void> logInUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU",
      );
      final headers = {"Content-Type": "application/json"};
      final body = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        context.showSnackBar("loggin successful");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => Mainscreen()),
        );
        print(response.statusCode);
        print("Successfull log in");
      } else {
        context.showSnackBar("Invalid username or password", isError: true);
      }
    } catch (e) {
      throw Exception("Error log in : $e");
    }
  }

  /// Confirms the password reset using oobCode and new password
  static Future<void> confirmResetPassword({
    required String oobCode,
    required String newPassword,
    required BuildContext context,
  }) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:resetPassword?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'oobCode': oobCode, 'newPassword': newPassword}),
    );

    if (response.statusCode == 200) {
      context.showSnackBar("Successful change password");
    } else {
      context.showSnackBar('error changing password', isError: true);
    }
  }

  // oob code sending

  static Future<void> sendOobCode({
    required String email,
    required BuildContext context,
  }) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyBKlcUU2x_aoPkH7LtTSIz5Ypp1cEcvWCU';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'requestType': 'PASSWORD_RESET', 'email': email}),
    );

    if (response.statusCode == 200) {
      context.showSnackBar("Successful send email");
      Navigator.pop(context);
      print(' Password reset email sent to $email');
    } else {
      context.showSnackBar('error sending email', isError: true);
    }
  }
}
