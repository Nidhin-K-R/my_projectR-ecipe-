import 'package:flutter/material.dart';
import 'package:my_project/viewmodel/providers/app_providers.dart';
import 'package:provider/provider.dart';

class CustomTextfields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final dynamic icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool suffixIcon;

  const CustomTextfields({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordProvider>(
      builder: (context, value, child) => TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText
            ? value.flag
                  ? false
                  : true
            : false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: labelText,
          icon: Icon(icon),
          suffixIcon: suffixIcon
              ? IconButton(
                  onPressed: () {
                    value.changeIcon();
                  },
                  icon: value.flag
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }
}
