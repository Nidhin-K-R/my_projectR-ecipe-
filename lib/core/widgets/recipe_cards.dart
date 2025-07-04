import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeCards extends StatefulWidget {
  const RecipeCards({super.key});

  @override
  State<RecipeCards> createState() => _RecipeCardsState();
}

class _RecipeCardsState extends State<RecipeCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(height: 250.h, width: 150.h),
    );
  }
}
