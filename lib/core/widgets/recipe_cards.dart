import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/core/constant/app_colors.dart';

import 'package:my_project/viewmodel/recipe_viewmodel.dart';
import 'package:provider/provider.dart';

class RecipeCards extends StatelessWidget {
  const RecipeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Consumer<RecipeViewModel>(
        builder: (context, value, child) {
          if (value.isLoading == true) {
            return Center(child: CircularProgressIndicator());
          }
          if (value.error != null) {
            return Center(child: Text("Error ${value.error}"));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: value.recipes.length,
            itemBuilder: (context, index) {
              var recipe = value.recipes[index];

              return Card(
                clipBehavior: Clip.hardEdge,
                shadowColor: AppColors.subTextColor,

                child: Container(
                  // recipie card background
                  color: AppColors.surfaceColor,
                  child: Stack(
                    children: [
                      // Image background
                      SizedBox(
                        width: 200.w,
                        height: 150.h,
                        child: Image.network(recipe.image, fit: BoxFit.cover),
                      ),

                      // Text overlay
                      Positioned(
                        bottom: 2.h,
                        left: 10.w,
                        right: 10.w,
                        child: Padding(
                          padding: EdgeInsets.all(38.r),
                          child: AutoSizeText(
                            recipe.name,
                            maxLines: 2,
                            minFontSize: 20,
                            style: TextStyle(
                              color: AppColors.nTextColor,
                              fontSize: 18.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // time stamp and rating
                      Positioned(
                        bottom: 3.h,
                        left: 12.w,
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.clock_1,
                              size: 18.r,
                              color: Colors.black,
                            ),
                            Text(
                              " ${recipe.prepTimeMinutes.toString()} Min",
                              style: TextStyle(
                                fontSize: 15.r,
                                fontWeight: FontWeight.bold,
                                color: AppColors.nTextColor,
                              ),
                            ),
                            SizedBox(width: 50.w),
                            Icon(
                              Iconsax.star_1,
                              color: AppColors.ratingStarColor,
                              size: 25.r,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              recipe.rating.toString(),
                              style: TextStyle(
                                fontSize: 18.r,
                                color: AppColors.nTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
