import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/core/widgets/app_categories.dart';
import 'package:my_project/core/widgets/app_searchbar.dart';
import 'package:my_project/core/widgets/banner.dart';
import 'package:my_project/core/widgets/recipe_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20.w,
              vertical: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What are you Cooking today?",
                  style: TextStyle(
                    fontSize: 35.r,
                    fontWeight: FontWeight.bold,
                    height: 0.9.h,
                  ),
                ),
                SizedBox(height: 15.h),
                AppSearchbar(),
                SizedBox(height: 15.h),
                BannerCard(),
                SizedBox(height: 5.h),
                AppCategories(),
                Text(
                  "Recommended for you",
                  style: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold),
                ),
                RecipeCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
