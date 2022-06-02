import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BasicShapes extends StatefulWidget {
  @override
  BasicShapesState createState() => BasicShapesState();
}

class BasicShapesState extends State<BasicShapes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.amber,
                    child: CustomPaint(
                      size: Size(250, 250),
                      painter: SquareShape(),
                    )),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: CustomPaint(
                      size: Size(250, 250),
                      painter: CircleShape(),
                    )),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.pinkAccent,
                    child: CustomPaint(
                      size: Size(250, 250),
                      painter: RectangleShape(),
                    )),
              ),
              Center(
                child: Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.pinkAccent,
                    child: CustomPaint(
                      size: Size(250, 250),
                      painter: RectangleShape(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SquareShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center=Offset(size.width/2, size.height/2);
    var radius=size.width/2;
    var paint=Paint()..color=Colors.grey..strokeWidth=(12.0)..style=PaintingStyle.fill;
    var paint1=Paint()..color=Colors.purple;

    canvas.drawCircle(center, radius,paint);
    canvas.drawCircle(center, radius-10,paint1);
    canvas.drawLine( Offset(size.width / 2, size.height / 2),
        Offset(size.width, size.height / 2), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
