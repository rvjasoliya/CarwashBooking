import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

setWidgetShadow({color = Colors.black, opacity = 0.3, blur = 5.0, spred = 4.0, x = 0.0, y=0.0}){
  return [
    BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: blur,
        spreadRadius: spred,
        offset: Offset(x, y)// changes position of shadow
    )
  ];
}

progressView(){
  return Center(
    child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(fromHex("#5872A6"))
    ),
  );
}

colorCell({color}) {
  return Container(
    height: 14,
    width: 14,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}