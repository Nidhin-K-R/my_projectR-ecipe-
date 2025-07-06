import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_project/view/home_screen.dart';
import 'package:my_project/view/login_screen.dart';
import 'package:my_project/view/signup_screen.dart';
import 'package:my_project/view/update_password_screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<Widget> Page = [
    HomeScreen(),
    LoginScreen(),
    SignupScreen(),
    UpdatePasswordScreen(),
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
          BottomNavigationBarItem(icon: Icon(Iconsax.login), label: "Login"),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.signpost),
            label: "Signup",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.password_check),
            label: "NewPassword",
          ),
        ],
      ),
      body: Page[selectedIndex],
    );
  }
}
