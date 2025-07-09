import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/core/service/auth_service.dart';
import 'package:my_project/core/utils/form_validators.dart';
import 'package:my_project/core/widgets/custom_textfields.dart';
import 'package:my_project/core/widgets/submit_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/images/forgot.png"),
                Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 25.r, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Please enter your registered email address we will get back you with the reset password and create a new password",
                  style: TextStyle(fontSize: 15.r, fontWeight: FontWeight.w600),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h),
                CustomTextfields(
                  controller: emailController,
                  labelText: "Enter Email",
                  focusNode: emailFocusNode,
                  onFocus: buttonFocusNode,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidators.validateEmail,
                ),
                SizedBox(height: 30.h),
                SubmitButton(
                  text: "Submit",
                  focusNode: buttonFocusNode,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthService.sendOobCode(
                        email: emailController.text,
                        context: context,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
