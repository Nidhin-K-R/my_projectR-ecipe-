import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void changeCategory(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
