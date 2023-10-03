import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/Widget/CountDownTimer.dart';
import 'package:carwash_booking/models/pendingBooking.dart';
import 'package:carwash_booking/others/common.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:carwash_booking/screens/bookingDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PendingBooking extends StatefulWidget {
  @override
  _PendingBookingState createState() => _PendingBookingState();
}

class _PendingBookingState extends State<PendingBooking> {

  UserController _userController = Get.put(UserController());

  getColor({String type}) {
    if (type == "Body Polish".toLowerCase()) return Colors.red;
    if (type == "Cabin Polish".toLowerCase()) return Colors.yellowAccent;
    if (type == "Cabin Senitization".toLowerCase()) return Colors.green;
    if (type == "Cabin Dusting".toLowerCase()) return Colors.brown;
    if (type == "Vacuum Cleaning".toLowerCase()) return Colors.blue;
    // else{
    //   return Colors.red;
    // }
  }

  pendingDetailsCell({bookingId}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 8),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Booking ID $bookingId'),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return BookingDetails();
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF3FBFF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _userController.profileApiCall();
    _userController.washerDailyDuty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 60),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  height: 80,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.logo,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                CountDownTimer()
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Pending Booking (${_userController.dailyDutyList.length})',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "🟥 Body Polish   🟨 Cabin Polish   🟩 Cabin Sanitization   🟫 Cabin Dusting   🟦 Vacuum Cleaning",
                style: TextStyle(fontFamily: popMed, color: Colors.black, fontSize: 13, height: 1.7),
              ),
            ),
            Expanded(
              child: GetX<UserController>(
                builder: (controller) {
                  if(controller.dailyDutyList.length == 0){
                    return Center(
                      child: Text("No data found"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.dailyDutyList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                    top: 15, bottom: 15, left: 20, right: 20),
                                padding: const EdgeInsets.only(
                                    left: 15, right: 5, top: 10, bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset.zero,
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${controller.dailyDutyList[index].serviceDate}",
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${controller.dailyDutyList[index].userName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${controller.dailyDutyList[index].vehicleNum}",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        width: 45,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                                child:
                                                colorCell(color: getColor(type: controller.dailyDutyList[index].service_interior_name.toLowerCase())
                                                ) ),
                                            Positioned(
                                                 right: 20,
                                                child:
                                                colorCell(color: getColor(type: controller.dailyDutyList[index].service_exterior_name.toLowerCase()))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  alignment: Alignment.center,
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
                                    shape: BoxShape.circle,
                                  ),
                                  height: 30,
                                  width: 30,
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: (size.width / 2) - 55,
                                child: InkWell(
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      withNavBar: false,
                                      screen: BookingDetails(dutyDetail: controller.dailyDutyList[index],),
                                    );
                                  },
                                  child: Container(
                                    width: 110,
                                    padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                                    ),
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
