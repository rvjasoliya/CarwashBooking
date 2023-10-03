import 'dart:io';
import 'package:carwash_booking/models/data.dart';
import 'package:carwash_booking/models/drawerPaint.dart';
import 'package:carwash_booking/models/screenUtils.dart';
import 'package:carwash_booking/others/constants.dart';
import 'package:carwash_booking/screens/attendanceScreen.dart';
import 'package:carwash_booking/screens/loginPage.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  List<SlideDao> list;
  int currentState = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    list = getSlides();
  }

  Widget pageIndicator(bool checked){

    double Function(double size) hp = ScreenUtils(context).hp;

    return checked ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: hp(1),
        width: hp(2.5),
        decoration: BoxDecoration(
            color: AppColors.deepBlue,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    ) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height:  hp(1),
        width:   hp(1),
        decoration: BoxDecoration(
            color: AppColors.skyBlue,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double Function(double size) hp = ScreenUtils(context).hp;

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: controller,
        onPageChanged: (val) {
          setState(() {
            currentState = val;
          });
        } ,
        itemCount: list.length,
        itemBuilder: (context,index){
          return SlidingView(
              list[index].imagePath,
              list[index].title,
              list[index].desc
          );
        },
      ),
      bottomSheet: currentState!=list.length-1 ? Container(
        height: Platform.isIOS ? hp(9) : hp(8),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: Text("SKIP", style: TextStyle(fontFamily: popMed),),
              onTap: (){
                controller.jumpToPage(list.length-1);
              },
            ),

            GestureDetector(
              child: Text("NEXT", style: TextStyle(fontFamily: popMed),),
              onTap: (){
                controller.animateToPage(currentState+1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
            ),
          ],
        ),

      )
          : InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
        },
        child: Container(
          alignment: Alignment.center,
          height: Platform.isIOS ? hp(9) : hp(8),
          width: MediaQuery.of(context).size.width,
          color: AppColors.deepBlue,
          child: Text("GET STARTED", style: TextStyle(color: Colors.white,fontFamily: popMed),),
        ),
      ),
    );
  }
}

class SlidingView extends StatefulWidget {

  String imageAssetPath, title, desc;
  SlidingView(this.imageAssetPath, this.title, this.desc);

  @override
  _SlidingViewState createState() => _SlidingViewState();
}

class _SlidingViewState extends State<SlidingView> with SingleTickerProviderStateMixin {

  Animation<double> heroAnimation;
  AnimationController animationController;


  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double Function(double size) hp = ScreenUtils(context).hp;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          RotatedBox(
            quarterTurns: 45,
            child: Container(
              height: hp(100),
              child: CustomPaint(
                painter: DrawerPaint(),
              ),
            ),
          ),

          AnimatedBuilder(
            animation: heroAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(heroAnimation.value, 0),
                child: Padding(
                    padding: const EdgeInsets.only(top: 55.0),
                    child: Image.asset(widget.imageAssetPath,height: hp(50), fit: BoxFit.scaleDown,)
                ),
              );
            },
          ),

          Text(widget.title,textAlign: TextAlign.center, style: TextStyle(fontFamily: kGilroyBold, fontSize: hp(2.5)),),
          SizedBox(height: hp(0.5),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(widget.desc, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

