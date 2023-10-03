
import 'package:carwash_booking/Service/Api.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatefulWidget {
  bool isPayment;
  ProfileScreen({this.isPayment = false});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Stack(
                      children: [
                        Image.asset(AppImages.logo,
                            fit: BoxFit.cover, width: 1000.0),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.deepBlue, AppColors.deepBlueTrans],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 85,
                      backgroundImage: NetworkImage("${Api.kAssetsUrl}${profileData.userPhoto}"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Name', style: TextStyle(fontFamily: kGilroySemiBold),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(profileData.userName),
            ),
            Divider(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Mobile', style: TextStyle(fontFamily: kGilroySemiBold,),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(profileData.userMobile),
                  SizedBox(width: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                    child: Text("verified",style: TextStyle(fontFamily: kGilroyReg,color: Colors.white, fontSize: 17)),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Email', style: TextStyle(fontFamily: kGilroySemiBold),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(profileData.userEmail),
            ),
            Divider(),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Address', style: TextStyle(fontFamily: kGilroySemiBold),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(profileData.userAddress),
            ),
          ],
        ),
      )
    );
  }
}
