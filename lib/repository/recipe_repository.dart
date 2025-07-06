// repository/recipe_repository.dart

import 'package:my_project/core/service/api_services.dart';
import 'package:my_project/models/recipe_model.dart';

class RecipeRepository {
  final ApiService apiService;

  RecipeRepository({required this.apiService});

  Future<List<RecipeModel>> getAllRecipes() async {
    return await apiService.fetchRecipes();
  }
}
