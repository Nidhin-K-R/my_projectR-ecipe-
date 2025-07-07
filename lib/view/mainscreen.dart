import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/view/home_screen.dart';
import 'package:my_project/view/saved_screen.dart';
import 'package:my_project/view/settings_screen.dart';
import 'package:my_project/view/update_password_screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<Widget> Page = [
    HomeScreen(),
    SavedScreen(),
    UpdatePasswordScreen(),
    SettingsScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        iconSize: 30.r,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Iconsax.bookmark), label: "saved"),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.key),
            label: "NewPassword",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting),
            label: "settings",
          ),
        ],
      ),
      body: Page[selectedIndex],
    );
  }
}
