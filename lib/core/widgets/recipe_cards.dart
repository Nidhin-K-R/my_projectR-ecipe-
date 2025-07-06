import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/viewmodel/recipe_viewmodel.dart';
import 'package:provider/provider.dart';

class RecipeCards extends StatelessWidget {
  const RecipeCards({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecipeViewModel>(context);

    return viewModel.isLoading
        ? Center(child: const CircularProgressIndicator())
        : viewModel.error != null
        ? Text('Error : ${viewModel.error}')
        : SizedBox(
            height: 220.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: viewModel.recipes.length,
              itemBuilder: (context, index) {
                var recipe = viewModel.recipes[index];

                return Card(
                  clipBehavior: Clip.hardEdge,
                  shadowColor: Colors.grey,
                  child: Stack(
                    children: [
                      // Image background
                      Container(
                        width: 200.w,
                        height: 220.h,
                        child: Image.network(recipe.image, fit: BoxFit.cover),
                      ),

                      // Text overlay
                      Positioned(
                        bottom: 5.h,
                        left: 10.w,
                        right: 10.w,
                        child: Container(
                          height: 100.h,
                          padding: EdgeInsets.all(6.r),
                          color: Colors.black12,
                          child: Column(
                            children: [
                              AutoSizeText(
                                recipe.name,
                                maxLines: 2,
                                minFontSize: 10,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.clock,
                                    size: 18.r,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " ${recipe.prepTimeMinutes.toString()} Min",
                                    style: TextStyle(
                                      fontSize: 15.r,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 40.w),
                                  Icon(
                                    Iconsax.star1,
                                    color: Colors.amber,
                                    size: 25.r,
                                  ),
                                  Text(
                                    recipe.rating.toString(),
                                    style: TextStyle(
                                      fontSize: 18.r,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
