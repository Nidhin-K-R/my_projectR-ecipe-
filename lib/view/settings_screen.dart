import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25.r, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 55.r),
                      SizedBox(width: 15.w),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Recipies",
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Followers",
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 55.w),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 55.w),
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
