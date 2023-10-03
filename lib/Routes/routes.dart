
import 'package:carwash_booking/screens/attendanceScreen.dart';
import 'package:carwash_booking/screens/bottomBar.dart';
import 'package:carwash_booking/screens/homeScreen.dart';
import 'package:carwash_booking/screens/introScreen.dart';
import 'package:carwash_booking/screens/loginPage.dart';
import 'package:carwash_booking/screens/splashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class PageRoutes {
  static const String homeScreen = '/HomeScreen';
  static const String splashScreen = '/SplashScreen';
  static const String attendanceScreen = '/AttendanceScreen';
  static const String loginScreen = '/LoginPage';
  static const String introScreen = '/IntroScreen';
  static const String bottomBar = '/BottomBar';

  static final route = [
  GetPage(name: PageRoutes.splashScreen, page: () => SplashScreen(),),
  GetPage(name: PageRoutes.homeScreen, page: () => HomeScreen(),),
  GetPage(name: PageRoutes.attendanceScreen, page: () => AttendanceScreen(),),
  GetPage(name: PageRoutes.loginScreen, page: () => LoginPage(),),
  GetPage(name: PageRoutes.introScreen, page: () => IntroScreen(),),
    GetPage(name: PageRoutes.bottomBar, page: () => BottomBar(),),
  ];
}