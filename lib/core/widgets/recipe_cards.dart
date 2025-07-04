import 'package:flutter/material.dart';
import 'package:my_project/core/service/api_services.dart';
import 'package:my_project/models/recipe_model.dart';

class RecipeCards extends StatelessWidget {
  const RecipeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
      future: ApiServices.getRecipes(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error : ${snapshot.error}"));
        }

        final recipes = snapshot.data!;
        return SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: recipes.length,
            itemBuilder: (context, index) {
              var recipe = recipes[index];

              return Card(
                clipBehavior: Clip.hardEdge,
                shadowColor: Colors.grey,
                child: Container(
                  width: 200,
                  height: 150,

                  child: Image.network(recipe.image, fit: BoxFit.cover),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
