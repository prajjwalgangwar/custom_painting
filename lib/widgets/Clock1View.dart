import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Clock1View extends StatefulWidget {
  var width, height;

  Clock1View(this.width, this.height);

  @override
  Clock1ViewState createState() => Clock1ViewState();
}

class Clock1ViewState extends State<Clock1View> {

  DateTime? dateTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    this.dateTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime = dateTime!.add(Duration(seconds: 1));
      if(mounted){
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: Clock1Painter(widget.width, widget.height),
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}

class Clock1Painter extends CustomPainter {
  var width, height;

  Clock1Painter(this.width, this.height);

  DateTime currentTime = DateTime.now();

  // Clock1Painter({required this.currentTime});
  void paint(Canvas canvas, Size size) {
    var centerX = (width / 2) as double;
    var centerY = height / 2 as double;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    print('radius = $centerX');


    final fillBackground = Paint()..color = Colors.black;
    final fillCenter = Paint()..color = Color(0xFFECE5C7);
    final fillBoundry = Paint()
      ..color = Color(0xFFECE5C7)
      ..strokeWidth =5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, fillBackground);
    canvas.drawCircle(center, radius, fillBoundry);
    canvas.drawCircle(center, 8, fillCenter);

    var secHandX = centerX +  (radius - 5) * cos(currentTime.second * 6 * pi / 180);
    var secHandY = centerX +  (radius - 5) * sin(currentTime.second * 6 * pi / 180);
    var minHandX = centerX + (radius - 15) * cos(currentTime.minute * 6 * pi / 180);
    var minHandY = centerX + (radius - 15) * sin(currentTime.minute * 6 * pi / 180);
    var hourHandX = centerX + (radius - 25) * cos((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + (radius - 25) * sin((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 8;


    final fillSec = Paint()
    ..color = Color(0xFFB20600);

    final secHandBrush = Paint()
      ..color = Color(0xFFECE5C7)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final minHandBrush = Paint()
      ..color = Color(0xFFF0A500)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final hourHandBrush = Paint()
      ..color = Color(0xFFF0A500)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;


    final indicatorBreakBrush = Paint()
      ..color = Colors.black38;

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    canvas.drawCircle(center, 4, fillSec);


    for (int i = 0; i <= 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      if (i%30 ==0 ) {
        indicatorBreakBrush.strokeWidth = 60;
      }else{
        indicatorBreakBrush.strokeWidth = 1;
      }


      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), indicatorBreakBrush);
    }
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
