import 'dart:convert';
import 'package:carwash_booking/Routes/routes.dart';
import 'package:carwash_booking/Service/ApiManager.dart';
import 'package:carwash_booking/models/WasherDailyDutyModel.dart';
import 'package:carwash_booking/models/profileModel.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class UserController extends GetxController {
  TextEditingController mobileTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();

  List<WasherDailyDutyModel> washerDailyDutyModel;
  var dailyDutyList = List<WasherDailyDutyModel>().obs;

  signInClick() async {
    if (mobileTEC.text.trim().length == 0) {
      Get.snackbar("Alert!!", "Mobile No. cann't be empty!!");
      return;
    }
    if (!GetUtils.isPhoneNumber(mobileTEC.text)) {
      Get.snackbar("Alert!!", AppErrors.mobileErr);
      return;
    }
    if (passwordTEC.text.trim().length == 0) {
      Get.snackbar("Alert!!", AppErrors.passErr);
      return;
    }
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    http.Response response = await ApiManager().loginApi(
      mobile: mobileTEC.text,
      pass: passwordTEC.text,
    );
    Get.back();
    var user = jsonDecode(response.body);
    if (user['success'] != 0) {
      profileData = ProfileModel.fromJson(user['success'][0]);
      //storageManager.saveProfile(profile: user['success'][0]);
      if (profileData.today_att == 0) {
        Get.offAllNamed(PageRoutes.attendanceScreen);
      } else
        Get.offAllNamed(PageRoutes.bottomBar);
    }
    else {
      Get.snackbar("Alert!!", "Login Failed!!");
    }
  }

  washerAttan({id, date, lat, log}) async{
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    http.Response response = await ApiManager().washerAttan(
      id: id,
      date: date,
      lat: lat,
      log: log,
    );
    var jsondata = jsonDecode(response.body);
    print("jsondata");
    print(jsondata);
    Get.back();
    if(jsondata['success'] == 1){
      Get.offAllNamed(PageRoutes.bottomBar);
    } else{
      Get.snackbar("Alert!!", "Connection error occur!!");
    }
  }

  checkTodayAttr({id}) async {
    http.Response response = await ApiManager().checkTodayAttr(
      id: id,
    );
    var jsondata = jsonDecode(response.body);
    if(jsondata['success'] == 1){
      Get.offAllNamed(PageRoutes.bottomBar);
    } else{
      Get.offAllNamed(PageRoutes.attendanceScreen);
    }
}

  profileApiCall() async {
    http.Response response = await ApiManager().viewProfile();
    var userData = jsonDecode(response.body);
    if(userData['success'] == 1){
      profileData = ProfileModel.fromJson(userData["profile"][0]);
      storageManager.saveProfile(profile: userData['profile'][0]);
      print("profileData.userId        ${profileData.userName}");
    }
    else {
      Get.snackbar("Alert!!", "User Data not found!!");
    }
  }

  washerDailyDuty() async {
    http.Response response = await ApiManager().washerDailyDuty();
    var washerDutyData = jsonDecode(response.body);
    if(washerDutyData["success"] != null) {
      var rs = List.from(washerDutyData["success"]).map((e) => WasherDailyDutyModel.fromJson(e)).toList();
      dailyDutyList.assignAll(rs);
      //washerDailyDutyModel = WasherDailyDutyModel.fromJson(washerDutyData["success"]) as List<WasherDailyDutyModel>;
    }
    else {
      Get.snackbar("Alert!!", "Data not found!!");
    }
  }

  startTimeApiCall({calendar_id, starttime}) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    http.Response response = await ApiManager().starttime(
      calendar_id: calendar_id,
      starttime: starttime,
    );
    Get.back();
    var rs = jsonDecode(response.body);
    print(rs["success"]);

    // if(rs["success"] != 0) {
    //
    // }
  }

  endTimeApiCall({calendar_id, endtime}) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    http.Response response = await ApiManager().endtime(
      calendar_id: calendar_id,
      endtime: endtime,
    );
    Get.back();
    var rs = jsonDecode(response.body);
    print(rs["success"]);
    // if(rs["success"] != 0)
    //   {
    //
    //   }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
