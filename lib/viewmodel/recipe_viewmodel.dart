import 'package:flutter/material.dart';
import 'package:my_project/models/recipe_model.dart';
import 'package:my_project/repository/recipe_repository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository repository;

  RecipeViewModel({required this.repository});

  List<RecipeModel> _recipes = [];
  bool _isLoading = false;
  String? _error;

  List<RecipeModel> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _recipes = await repository.getAllRecipes();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
