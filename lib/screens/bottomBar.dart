import 'package:carwash_booking/Controllers/user_controller.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/others/storageManager.dart';
import 'package:carwash_booking/screens/homeScreen.dart';
import 'package:carwash_booking/screens/pendingBooking.dart';
import 'package:carwash_booking/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);


  List<Widget> _buildScreens() {
    return [
      PendingBooking(),
      HomeScreen(),
      HomeScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.local_car_wash),
        title: "Requests",
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.date_range),
        title: "Bookings",
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: "Search",
        inactiveColor: Colors.grey,
        activeColor: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_outlined),
        title: "Accounts",
        activeColor: AppColors.primaryColor,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        hideNavigationBar: false,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset.zero,
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          //animateTabTransition: true,
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarHeight: 60,
        margin: EdgeInsets.only(left: 5, right: 5),
        navBarStyle: NavBarStyle.style14,
      ),
    );
  }
}
