// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:my_project/core/constant/api_constants.dart';
// import 'package:my_project/models/recipe_model.dart';

// class ApiServices {
//   //get method
//   static Future<List<RecipeModel>> getRecipe() async {
//     final response = await http.get(
//       Uri.parse("${ApiConstants.baseUrl}/${ApiConstants.urlEndPoint}"),
//     );
//     if (response.statusCode == 200) {
//       final List<dynamic> recipieJson = jsonDecode(response.body)['recipes'];
//       return recipieJson.map((json) => RecipeModel.fromJson(json)).toList();
//     } else {
//       throw Exception("failed users");
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/models/recipe_model.dart';

class ApiServices {
  static const String baseUrl = "https://dummyjson.com/recipes";

  static Future<List<RecipeModel>> getRecipes() async {
    try {
      final uri = Uri.parse(baseUrl);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final List<dynamic> recipesJson = jsonBody['recipes'];

        return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        print(" Failed to fetch recipes. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print(" Exception occurred while fetching recipes: $e");
      return [];
    }
  }
}
