import 'dart:math';

import 'package:flutter/material.dart';

import 'time_model.dart';
import 'style.dart';

// ignore: must_be_immutable
class ClockWidget extends StatefulWidget {
  ClockWidget(this.time, {super.key});
  TimeModel time;

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decorating the container
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //effects
          boxShadow: [
            BoxShadow(
                color: AppStyle.primaryColor.withAlpha(80), blurRadius: 38.0)
          ]),
      height: 300.0,
      width: 300.0,
      child: CustomPaint(
        painter: ClockPainter(widget.time),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  //setting the time parameter
  TimeModel? time;
  ClockPainter(this.time);
  @override
  void paint(Canvas canvas, Size size) {
    // calculating time
    double secRad = ((pi / 2) - (pi / 30) * this.time!.sec!) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * this.time!.min!) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * this.time!.hour!) % (2 * pi);
    //lets set some important points cordinates
    var CenterX = size.width / 2;
    var CenterY = size.height / 2;
    var Center = Offset(CenterX, CenterY);
    var radius = min(CenterX, CenterY);

//setting the clock cordinates
    var secHeight = radius / 2;
    var minHeight = radius / 2 - 10;
    var hourHeight = radius / 2 - 25;

    var seconds = Offset(
        CenterX + secHeight * cos(secRad), CenterY - secHeight * sin(secRad));
    var minutes = Offset(
        CenterX + minHeight * cos(minRad), CenterY - minHeight * sin(minRad));
    var hours = Offset(CenterX + hourHeight * cos(hourRad),
        CenterY - hourHeight * sin(hourRad));
    //setting the brush
    var fillBrush = Paint()
      ..color = AppStyle.primaryColor
      ..strokeCap = StrokeCap.round;

    var centerDotBrush = Paint()..color = Color(0xFFEAECFF);
//setting the hand brush
    var secBrush = Paint()
      ..color = Colors.red
      ..shader = PaintingStyle.stroke as Shader?
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.white
      ..shader = PaintingStyle.stroke as Shader?
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    var hourBrush = Paint()
      ..color = Colors.white
      ..shader = PaintingStyle.stroke as Shader?
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;

//drawing the body
    canvas.drawCircle(Center, radius - 40, fillBrush);
//drawing clock hands
    canvas.drawLine(Center, seconds, secBrush);
    canvas.drawLine(Center, minutes, minBrush);
    canvas.drawLine(Center, hours, hourBrush);
    //drawing the center dot
    canvas.drawCircle(Center, 16, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
