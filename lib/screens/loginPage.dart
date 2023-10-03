import 'dart:convert';

import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/Service/ApiManager.dart';
import 'package:carwash_booking/models/profileModel.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:carwash_booking/screens/attendanceScreen.dart';
import 'package:carwash_booking/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  UserController _userController = Get.put(UserController());

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  textFieldCell(
      {index, hinttext, inputtype, keyboardType, icon, eyeIcon, TextEditingController controller}) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: inputtype,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 9),
                      prefixIcon: icon,
                      suffixIcon: eyeIcon,
                      border: InputBorder.none,
                      hintText: hinttext,
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.075),
                height: 90,
                width: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.logo,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            textFieldCell(
              controller: _userController.mobileTEC,
              index: 1,
              hinttext: 'Login Mobile Number',
              inputtype: false,
              keyboardType: TextInputType.number,
              icon:
                  Icon(Icons.call_outlined, color: Colors.grey, size: 20),
            ),
            SizedBox(height: 20),
            textFieldCell(
              controller: _userController.passwordTEC,
              index: 1,
              hinttext: 'Enter Password',
              inputtype: _obscureText,
              icon: Icon(Icons.security_outlined,
                  color: Colors.grey, size: 20),
              eyeIcon: InkWell(
                onTap: _toggle,
                child: Icon(
                    _obscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: Colors.grey,
                    size: 18),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                _userController.signInClick();
              },
              child: Container(
                width: size.width - 60,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset.zero,
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                  color: AppColors.primaryColor,
                  // border: Border.all(color: Colors.grey[300]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.lock, color: Colors.white,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
