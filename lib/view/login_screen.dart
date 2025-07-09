import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/core/constant/app_colors.dart';
import 'package:my_project/core/service/auth_service.dart';
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/core/utils/form_validators.dart';
import 'package:my_project/core/widgets/auth_button.dart';
import 'package:my_project/core/widgets/custom_textfields.dart';
import 'package:my_project/core/widgets/forgot_password_screen.dart';
import 'package:my_project/core/widgets/submit_button.dart';
import 'package:my_project/view/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 30.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Again!",
                    style: TextStyle(
                      fontSize: 40.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome back you've missed!",
                    style: TextStyle(
                      fontSize: 20.r,
                      color: AppColors.textColorLight,
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextfields(
                    controller: emailController,
                    labelText: "Enter Email",
                    focusNode: emailFocusNode,
                    onFocus: passwordFocusNode,
                    icon: Iconsax.message,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidators.validateEmail,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextfields(
                    controller: passwordController,
                    labelText: "Enter Password",
                    icon: Iconsax.key,
                    focusNode: passwordFocusNode,
                    onFocus: buttonFocusNode,
                    obscureText: true,
                    suffixIcon: true,
                    validator: FormValidators.validatePassword,
                  ),
                  SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: AppColors.textButtonColor,
                        fontSize: 15.r,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SubmitButton(
                    text: "Log in",
                    focusNode: buttonFocusNode,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AuthService.logInUser(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      } else {
                        context.showSnackBar("failed", isError: true);
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.dividerColor,
                          thickness: 1,
                          indent: 10.w,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Or SignUp With",
                        style: TextStyle(
                          //color: Colors.grey.shade500,
                          color: AppColors.subTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Divider(
                          color: AppColors.dividerColor,
                          thickness: 1,
                          endIndent: 10.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AuthButton(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 18.r,
                          color: AppColors.textColorLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => SignupScreen()),
                          );
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            color: AppColors.textButtonColor,
                            fontSize: 19.r,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
