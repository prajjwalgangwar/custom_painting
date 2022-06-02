import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SpacyBottomNavigationBar extends StatefulWidget{
  @override
  SpacyBottomNavigationBarState createState()=> SpacyBottomNavigationBarState();
}

class SpacyBottomNavigationBarState extends State<SpacyBottomNavigationBar>{

  static int selectedIndex = -1;
  List<IconData> icons = [Icons.add, Icons.adb_outlined,  Icons.account_box_rounded,Icons.accessibility_sharp, Icons.add_a_photo_rounded,];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(bottom: 300),
              color: Colors.amber,
              child: Icon(
                  selectedIndex == 0 ? icons.elementAt(0) :
                  selectedIndex == 1 ? icons.elementAt(1) :
                  selectedIndex == 2 ? icons.elementAt(2) :
                  selectedIndex == 3 ? icons.elementAt(3) :
                  selectedIndex == 4 ? icons.elementAt(4) :  Icons.error
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: SquareShape(),
                ),
                Center(
                  heightFactor: 1,
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      backgroundColor: Colors.red.shade900,
                      onPressed: (){selectedIndex = 2;
                      setState((){});},
                      child: Icon(Icons.account_box_rounded, color: Colors.red.shade50,),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){
                      selectedIndex = 0;
                      setState((){});
                    }, icon: const Icon(Icons.add), color: Colors.red.shade900,),
                    IconButton(onPressed: (){
                      selectedIndex = 1;
                      setState((){});
                    }, icon: const Icon(Icons.adb_outlined),  color: Colors.red.shade900),
                    SizedBox(width: size.width * 0.2, height: 80,),
                    IconButton(onPressed: (){
                      selectedIndex = 2;
                      setState((){});
                    }, icon: const Icon(Icons.accessibility_sharp),  color: Colors.red.shade900),
                    IconButton(onPressed: (){
                      selectedIndex = 3;
                      setState((){});
                    }, icon: const Icon(Icons.add_a_photo_rounded),  color: Colors.red.shade900),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class SquareShape extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()..color = Colors.red.shade50..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.1, 0, size.width *0.2, 0);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.4, size.height * 0.3);

    path.arcToPoint(Offset(size.width * 0.6, size.height * 0.3), radius: const Radius.circular(10), clockwise: false);

    path.quadraticBezierTo(size.width * 0.5,  0, size.width * 0.8, 0);
    path.quadraticBezierTo(size.width * 0.9, 0, size.width, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);


    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}