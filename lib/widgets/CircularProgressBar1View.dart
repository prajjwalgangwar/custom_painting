import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressBar1View extends StatefulWidget {
  double progress;

  CircularProgressBar1View(this.progress);

  @override
  CircularProgressBar1ViewState createState() =>
      CircularProgressBar1ViewState();
}

class CircularProgressBar1ViewState extends State<CircularProgressBar1View> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularProgressBar1Painter(widget.progress),
      child: SizedBox(
        width: 200,
        height: 200,
        // child: Center(child: Text('${_animation.value.toInt()}'),),
      ),
    );
  }

}

class CircularProgressBar1Painter extends CustomPainter {
  var progress;

  CircularProgressBar1Painter(this.progress);

  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    final fillBackground = Paint()..color = Colors.black;
    final fillBoundry = Paint()
      ..color = Color(0xFFECE5C7)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final fillArc = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..color = Colors.orange.shade900;

    var arcAngle = (2 * pi ) * (progress/100) ;
    canvas.drawCircle(center, radius, fillBackground);

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.width),
        -pi/2,
        arcAngle,
        false,
        fillArc);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius-10), 0, 150, false, fillBoundry);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
