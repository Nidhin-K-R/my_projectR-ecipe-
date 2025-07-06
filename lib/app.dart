import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_project/core/service/api_services.dart';
import 'package:my_project/repository/recipe_repository.dart';
import 'package:my_project/view/home_screen.dart';
import 'package:my_project/viewmodel/providers/app_providers.dart';
import 'package:my_project/viewmodel/providers/categories_provider.dart';
import 'package:my_project/viewmodel/recipe_viewmodel.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PasswordProvider()),
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
          ChangeNotifierProvider(
            create: (_) => RecipeViewModel(
              repository: RecipeRepository(apiService: ApiService()),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
