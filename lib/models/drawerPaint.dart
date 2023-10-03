import 'package:carwash_booking/others/constants.dart';
import 'package:flutter/material.dart';

class DrawerPaint extends CustomPainter {
  final Color curveColor;
  final Paint curvePaint;

  DrawerPaint({
    this.curveColor = skyBlueTrans,
  }) : curvePaint = Paint()
    ..color = curveColor
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var diameter = size.height / 3;

    path.moveTo(45, 0);
    path.relativeCubicTo(45, diameter * 0.4, -50, diameter / 2, 0, diameter);
    path.relativeCubicTo(50, diameter * 0.6, -15, diameter / 2, 0, diameter);
    path.relativeCubicTo(55, diameter * 0.7, -100, diameter * 0.7, 0, diameter);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, curvePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}