import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/screens/pendingBooking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/images/header_car_img.jpg",
                fit: BoxFit.cover, width: 1000.0, height: 200),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.all(15),
              padding:
                  EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
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
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Mark Attendance to View service',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (_) {
                //       return PendingBooking();
                //     },
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset.zero,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                width: size.width - 150,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  'Mark',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
