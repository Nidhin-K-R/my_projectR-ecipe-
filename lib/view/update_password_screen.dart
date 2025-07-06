import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/core/utils/form_validators.dart';
import 'package:my_project/core/widgets/custom_textfields.dart';
import 'package:my_project/core/widgets/submit_button.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 30.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: 30.r,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Your new password must be different from previously used passwords",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 70.h),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextfields(
                    controller: passwordController,
                    labelText: "Enter New Password",
                    icon: Iconsax.key,
                    focusNode: passwordFocusNode,
                    onFocus: confirmPasswordFocusNode,
                    obscureText: true,
                    validator: FormValidators.validatePassword,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: 15.r,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextfields(
                    controller: confirmPasswordController,
                    labelText: "Re Enter Password",
                    icon: Iconsax.key,
                    obscureText: true,
                    focusNode: confirmPasswordFocusNode,
                    onFocus: buttonFocusNode,
                    validator: FormValidators.validateNewPassword,
                  ),
                  SizedBox(height: 40.h),
                  SubmitButton(
                    text: "Log in",
                    focusNode: buttonFocusNode,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.showSnackBar("loggin successful");
                      } else {
                        context.showSnackBar("failed", isError: true);
                      }
                    },
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
