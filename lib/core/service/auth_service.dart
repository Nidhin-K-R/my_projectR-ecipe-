import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/core/constant/api_constants.dart';
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/view/mainscreen.dart';

class AuthService {
  // register
  static Future<void> regUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(ApiConstants.regUserUrl);

      final body = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      final response = await http.post(
        url,
        headers: ApiConstants.headers,
        body: body,
      );
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => Mainscreen()),
        );
        //print(response.statusCode);
        //print("Successfull");
      }
      if (response.statusCode == 400) {
        final body = jsonDecode(response.body);
        if (body['error']['message'] == 'EMAIL_EXISTS') {
          context.showSnackBar("Email is already registered", isError: true);
        }
      }
    } catch (e) {
      throw Exception("Error register: $e");
    }
  }

  // login
  static Future<void> logInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(ApiConstants.loginUserUrl);
      final body = json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      });
      final response = await http.post(
        url,
        headers: ApiConstants.headers,
        body: body,
      );
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
      context.showSnackBar("Exception: $e", isError: true);
      // throw Exception("Error log in : $e");
    }
  }

  // oob code sending

  static Future<void> sendOobCode({
    required String email,
    required BuildContext context,
  }) async {
    try {
      final url = ApiConstants.oobCodeUrl;

      final response = await http.post(
        Uri.parse(url),
        headers: ApiConstants.headers,
        body: jsonEncode({'requestType': 'PASSWORD_RESET', 'email': email}),
      );

      if (response.statusCode == 200) {
        context.showSnackBar("Password reset email sent");
        Navigator.pop(context);
        // print('Password reset email sent to $email');
      } else {
        context.showSnackBar('Error sending email', isError: true);
        //  print('Response: ${response.body}');
      }
    } catch (e) {
      context.showSnackBar("Exception: $e", isError: true);
      // print('Exception: $e');
    }
  }
}
