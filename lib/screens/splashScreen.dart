import 'dart:async';
import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/Routes/routes.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../others/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController _userController = Get.put(UserController());

  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      if (storageManager.getProfile() != null) {
        _userController.checkTodayAttr(id: profileData.userId);
      } else {
        Get.offAllNamed(PageRoutes.introScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
          ),
          Container(
            height: size.height * 0.22,
            width: size.width * 0.55,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.logo2,
                  ),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashScreenIma2),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
