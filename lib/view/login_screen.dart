import 'package:flutter/material.dart';
import 'package:my_project/core/utils/extension.dart';
import 'package:my_project/core/utils/form_validators.dart';
import 'package:my_project/core/widgets/custom_textfields.dart';
import 'package:my_project/core/widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 70),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 70),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextfields(
                  controller: nameController,
                  labelText: "Enter Username",
                  icon: Icons.person,
                  validator: FormValidators.validateName,
                ),
                const SizedBox(height: 25),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextfields(
                  controller: emailController,
                  labelText: "Enter email",
                  icon: Icons.email,
                  validator: FormValidators.validateEmail,
                ),
                const SizedBox(height: 25),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                CustomTextfields(
                  controller: passwordController,
                  labelText: "Enter Password",
                  icon: Icons.key,
                  validator: FormValidators.validatePassword,
                ),
                const SizedBox(height: 45),
                SubmitButton(
                  text: "Log in",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      context.showSnackBar("Login Successful");
                    } else {
                      context.showSnackBar("Login failed", isError: true);
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
