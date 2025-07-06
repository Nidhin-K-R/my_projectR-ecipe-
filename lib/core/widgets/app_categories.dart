import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/core/constant/app_colors.dart';
import 'package:my_project/viewmodel/providers/categories_provider.dart';
import 'package:my_project/viewmodel/recipe_viewmodel.dart';
import 'package:provider/provider.dart';

class AppCategories extends StatelessWidget {
  const AppCategories({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> categoryItems = [
      [
        "assets/images/breakfast.png",
        "assets/images/lunch.png",
        "assets/images/evening.png",
        "assets/images/dinner.png",
        "assets/images/desert.png",
        "assets/images/juice.png",
      ],
      ["Breakfast", "Lunch", "Snacks", "Dinner", "Desert", "Juice"],
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold),
            ),
            Consumer<CategoryProvider>(
              builder: (context, value, child) => TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                    value.selectedIndex == -1
                        ? AppColors.primaryVariant
                        : Colors.black54,
                  ),
                ),
                onPressed: () {
                  Provider.of<RecipeViewModel>(
                    context,
                    listen: false,
                  ).fetchRecipes();
                  value.changeCategory(-1);
                },
                child: Text("See All", style: TextStyle(fontSize: 15.r)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: categoryItems[0].length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Consumer<CategoryProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    InkWell(
                      radius: 23,
                      onTap: () {
                        value.changeCategory(index);
                      },
                      child: Card(
                        elevation: 0,
                        color: value.selectedIndex == index
                            ? AppColors.primaryVariant
                            : Colors.white,
                        child: Image.asset(
                          categoryItems[0][index],

                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                    ),
                    Text(
                      categoryItems[1][index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.r,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
