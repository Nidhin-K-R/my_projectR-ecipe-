import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/models/recipe_model.dart';

class ApiService {
  static const String baseUrl = "https://dummyjson.com/recipes";

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final uri = Uri.parse(baseUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final List<dynamic> recipesJson = jsonBody['recipes'];
        return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e) {
      throw Exception("Error fetching recipes: $e");
    }
  }
}
