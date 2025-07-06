import 'package:flutter/material.dart';
import 'package:my_project/viewmodel/recipe_viewmodel.dart';
import 'package:provider/provider.dart';

class RecipeCards extends StatefulWidget {
  const RecipeCards({super.key});

  @override
  State<RecipeCards> createState() => _RecipeCardsState();
}

class _RecipeCardsState extends State<RecipeCards> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context);

    return viewModel.isLoading
        ? Center(child: const CircularProgressIndicator())
        : viewModel.error != null
        ? Text('Error : ${viewModel.error}')
        : SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: viewModel.recipes.length,
              itemBuilder: (context, index) {
                var recipe = viewModel.recipes[index];

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
  }
}
