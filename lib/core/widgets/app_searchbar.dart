import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchbar extends StatelessWidget {
  const AppSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      trailing: [
        Icon(Iconsax.search_normal, color: Colors.black26),
        SizedBox(width: 20.w),
      ],
      hintText: "Search recipes....",
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.r,

          color: const Color.fromARGB(255, 221, 213, 213),
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: Colors.black26),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      elevation: WidgetStatePropertyAll(1),
    );
  }
}
