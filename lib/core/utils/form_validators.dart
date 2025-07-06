class FormValidators {
  static late String newPassword;
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Please enter email";
    if (!value.contains('@gmail.com')) return "Enter valid email";
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return "Please enter username";
    if (value.length < 3) return "Username too short";
    return null;
  }

  static String? validatePassword(String? value) {
    newPassword = value.toString();
    if (value == null || value.isEmpty) return "Please enter password";
    if (value.length < 6) return "password must be at least 6 characters";
    return null;
  }

  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) return "Please enter password";
    if (value.length < 6) return "password must be at least 6 characters";
    if (value != newPassword) return "password don't match!";
    return null;
  }
}
