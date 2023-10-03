import 'package:flutter/material.dart';

class ScreenUtils {
  BuildContext context;
  MediaQueryData queryData;

  ScreenUtils(this.context){
    queryData = MediaQuery.of(context);
  }


  double hp(double size) {
    double result =  (size*queryData.size.height)/100;
    return result;
  }

  double wp(double size) {
    double result =  (size*queryData.size.width)/100;
    return result;
  }
}