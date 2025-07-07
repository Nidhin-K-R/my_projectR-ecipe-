import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/core/constant/app_colors.dart';
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/core/utils/form_validators.dart';
import 'package:my_project/core/widgets/auth_button.dart';
import 'package:my_project/core/widgets/custom_textfields.dart';
import 'package:my_project/view/login_screen.dart';
import 'package:my_project/view/mainscreen.dart';
import '../core/widgets/submit_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final usernameFocusNode = FocusNode();
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
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 30.r,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Let's help you set up your account,\nit won't take long.",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.w900,
                      color: AppColors.subTextColor,
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextfields(
                    controller: usernameController,
                    labelText: "Enter Username",
                    icon: Iconsax.user,
                    focusNode: usernameFocusNode,
                    onFocus: emailFocusNode,
                    validator: FormValidators.validateName,
                  ),
                  SizedBox(height: 15.h),
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
                  SizedBox(height: 30.h),
                  SubmitButton(
                    text: "Sign Up",
                    focusNode: buttonFocusNode,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.showSnackBar("signup successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => Mainscreen()),
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
                          color: Colors.grey.shade300,
                          thickness: 1,
                          indent: 10.w,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Or SignUp With",
                        style: TextStyle(
                          color: AppColors.subTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
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
                        "Already have an account?",
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
                            MaterialPageRoute(builder: (ctx) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "LogIn",
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
