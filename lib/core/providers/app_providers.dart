import 'package:flutter/widgets.dart';

class PasswordProvider extends ChangeNotifier {
  bool flag = false;
  changeIcon() {
    flag = !flag;
    notifyListeners();
  }
}
