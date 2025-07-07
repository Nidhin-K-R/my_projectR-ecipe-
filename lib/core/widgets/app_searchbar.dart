import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/core/constant/app_colors.dart';

class AppSearchbar extends StatelessWidget {
  const AppSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStatePropertyAll(AppColors.backgroundColor),
      trailing: [
        Icon(Iconsax.search_normal, color: AppColors.searchIconColor),
        SizedBox(width: 20.w),
      ],
      hintText: "Search recipes....",
      hintStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 18.r, color: AppColors.searchTextColor),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: AppColors.searchIconColor),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      elevation: WidgetStatePropertyAll(1),
    );
  }
}
