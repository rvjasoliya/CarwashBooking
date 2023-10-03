import 'dart:math';

import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/others/common.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:carwash_booking/screens/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  UserController _userController = Get.put(UserController());
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {

          // print(DateFormat("dd-MM-yyyy").format(DateTime.now()));
          // print(position.latitude);
          // print(position.longitude);

      _userController.washerAttan(
        id: profileData.userId,
        date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        lat: position.latitude,
        log: position.longitude,
      );

    }).catchError((e) {
      print(e);
    });
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }

  void initState() {
    super.initState();
    if (!_permissionStatus.isGranted)
      requestPermission(Permission.location);
  }

  buttonCell({index, size, title, color, iconImage}) {
    return InkWell(
      onTap: () {
        if (index == 1) {
          if(_permissionStatus.isGranted) {
            _getCurrentLocation();
          }
          else {
            if(!_permissionStatus.isPermanentlyDenied) {
              requestPermission(Permission.location);
              Get.snackbar("Alert!!", "Please give location permission!!");
            }
            else {
              Get.snackbar("Alert!!", "Please give location permission!!");
            }
          }
        }
      },
      child: Container(
        width: size.width - 60,
        // alignment: Alignment.center,
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
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image(
              color: Colors.white,
              height: 25,
              width: 25,
              image: AssetImage(
                iconImage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(!_permissionStatus.isGranted);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.14,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 90,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.logo,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: size.height * 0.38,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.attendance,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          buttonCell(
            size: size,
            index: 1,
            title: 'Attendance',
            color: AppColors.primaryColor,
            iconImage: AppImages.attendanceIcon2,
          ),
          SizedBox(
            height: 10,
          ),
          // buttonCell(
          //   size: size,
          //   index: 1,
          //   title: 'Start Timer',
          //   color: fromHex('2B2B2B'),
          //   iconImage: AppImages.timer,
          // ),
        ],
      ),
    );
  }
}
