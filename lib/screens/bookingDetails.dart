import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/Widget/CountDownTimer.dart';
import 'package:carwash_booking/models/WasherDailyDutyModel.dart';
import 'package:carwash_booking/others/common.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingDetails extends StatefulWidget {
  WasherDailyDutyModel dutyDetail;

  BookingDetails({this.dutyDetail});

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  // void userFeedback({id, feedback}) async {
  //   var res = await new ApiService().userFeedback(id: id, feedback: feedback);
  //   if (res.statusCode == 200) {
  //     var data = jsonDecode(res.body);
  //     print(data['success']);
  //     print(data['success']);
  //     if(data['success'] == 1){
  //       Navigator.pop(context);
  //     }
  //   }
  // }

  bool _isVisible = true;
  UserController _userController = Get.put(UserController());

  userFeedbackDialog({calId}) {
    TextEditingController feedbackTEC = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Dialog(
          child: Container(
            margin: EdgeInsets.all(15.0),
            width: size.width * 0.75,
            height: 220,
            child: Column(
              children: [
                Text("Reason",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Reason",
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    focusColor: AppColors.cream,
                    fillColor: AppColors.cream,
                    hoverColor: AppColors.cream,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: AppColors.deepBlue2,
                          ),
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              alignment: Alignment.center,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              if (feedbackTEC.text.trim().length != 0) {
                                Navigator.pop(context);
                                // userFeedback(id: calId, feedback: feedbackTEC.text);
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: AppColors.deepBlueTrans,
                        ),
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bookingDetail({title, detail, size}) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.33,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            ':',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              detail,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buttonCell({title, index, size, color}) {
    return InkWell(
      onTap: () {
        if (index == 1) {
          setState(() {
            _isVisible = false;
            _userController.startTimeApiCall(
              starttime: DateFormat('hh:mm:ss').format(DateTime.now()),
              calendar_id: widget.dutyDetail.calendarId,
            );
          });
        } else if (index == 2) {
          setState(() {
            _isVisible = true;
            _userController.endTimeApiCall(
                endtime: DateFormat('hh:mm:ss').format(DateTime.now()),
                calendar_id: widget.dutyDetail.calendarId,
            );
            Navigator.of(context).pop();
          });
        } else if (index == 3) {
          return userFeedbackDialog(calId: 1);
        }
      },
      child: Container(
        width: size.width * 0.23,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_outlined),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.06),
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
              height: 15,
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset.zero,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 45,
                      child: Stack(
                        children: [
                          Positioned(
                            child: colorCell(color: Colors.green),
                          ),
                          Positioned(
                            right: 20,
                            child: colorCell(color: Colors.black),
                          ),
                          Positioned(
                            right: 9,
                            child: colorCell(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bookingDetail(title: 'Booking ID', detail: widget.dutyDetail.bookingId, size: size),
                  bookingDetail(title: 'Time', detail: widget.dutyDetail.time, size: size),
                  bookingDetail(title: 'Name', detail: widget.dutyDetail.userName, size: size),
                  bookingDetail(
                      title: 'Services',
                      detail: widget.dutyDetail.service_interior_name.isNotEmpty && widget.dutyDetail.service_exterior_name.isNotEmpty ?
                      "${widget.dutyDetail.service_interior_name},${widget.dutyDetail.service_exterior_name}" :
                      "${widget.dutyDetail.service_interior_name}${widget.dutyDetail.service_exterior_name}",
                      size: size),
                  // bookingDetail(title: 'Payment', detail: 'Paid', size: size),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  child: buttonCell(
                      title: 'Start',
                      index: 1,
                      size: size,
                      color: AppColors.primaryColor),
                  visible: _isVisible,
                ),
                Visibility(
                  child: buttonCell(
                      title: 'End',
                      index: 2,
                      size: size,
                      color: AppColors.primaryColor),
                  visible: !_isVisible,
                ),
                SizedBox(
                  width: 10,
                ),
                buttonCell(
                    title: 'NA',
                    index: 3,
                    size: size,
                    color: Color(0xff2B2B2B)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                cursorColor: Colors.grey,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Type Remark and comment...',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              color: Color(0xff2B2B2B),
              width: size.width - 50,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Complete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
