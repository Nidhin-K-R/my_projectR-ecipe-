import 'package:flutter/material.dart';

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
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: labelText,
        icon: Icon(icon),
        suffixIcon: suffixIcon ? Icon(Icons.visibility) : null,
      ),
    );
  }
}
