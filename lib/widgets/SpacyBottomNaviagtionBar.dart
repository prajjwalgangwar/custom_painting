import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SpacyBottomNavigationBar extends StatefulWidget {
  const SpacyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  SpacyBottomNavigationBarState createState() =>
      SpacyBottomNavigationBarState();
}

class SpacyBottomNavigationBarState extends State<SpacyBottomNavigationBar> with TickerProviderStateMixin{
  static int selectedIndex = -1;
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late AnimationController _animationController3;
  late AnimationController _animationController4;
  late AnimationController _animationController0;

  List<IconData> icons = [
    Icons.add,
    Icons.adb_outlined,
    Icons.account_box_rounded,
    Icons.accessibility_sharp,
    Icons.add_a_photo_rounded,
  ];

  @override
  void initState() {
    super.initState();
    _animationController0 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _animationController1 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _animationController2 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _animationController3 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _animationController4 =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
  }

  // bool animateIcon(index, ){
  //
  // }

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
              child: Icon(selectedIndex == 0
                  ? icons.elementAt(0)
                  : selectedIndex == 1
                      ? icons.elementAt(1)
                      : selectedIndex == 2
                          ? icons.elementAt(2)
                          : selectedIndex == 3
                              ? icons.elementAt(3)
                              : selectedIndex == 4
                                  ? icons.elementAt(4)
                                  : Icons.error),
            ),
          ),
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: SquareShape(index: selectedIndex),
                ),
                Center(
                  heightFactor: 1,
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton(
                      backgroundColor: Colors.red.shade900,
                      onPressed: () {
                        selectedIndex = 2;
                        setState(() {
                          if(selectedIndex == 2){
                            _animationController2.forward();
                          }
                          _animationController0.reverse();
                          _animationController1.reverse();
                          _animationController3.reverse();
                          _animationController4.reverse();
                        });
                      },
                      child: AnimatedIcon(progress: _animationController2, icon: AnimatedIcons.menu_arrow,),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        selectedIndex = 0;
                        setState(() {
                          if(selectedIndex == 0){
                            _animationController0.forward();
                          }
                          _animationController1.reverse();
                          _animationController2
                              .reverse();
                          _animationController4.reverse();
                          _animationController3.reverse();
                        });
                      },
                      icon: AnimatedIcon(progress: _animationController0, icon: AnimatedIcons.home_menu,),
                      color: selectedIndex != 0 ? Colors.red.shade900 : Colors.red.shade50,
                    ),
                    IconButton(
                        onPressed: () {
                          selectedIndex = 1;
                          setState(() {
                            if(selectedIndex == 1){
                              _animationController1.forward();
                            }
                            _animationController0.reverse();
                            _animationController2.reverse();
                            _animationController3.reverse();
                            _animationController4.reverse();
                          });
                        },
                        icon: AnimatedIcon(progress: _animationController1, icon: AnimatedIcons.list_view,),
                        color: selectedIndex != 1 ? Colors.red.shade900 : Colors.red.shade50),
                    SizedBox(
                      width: size.width * 0.2,
                      height: 80,
                    ),
                    IconButton(
                        onPressed: () {
                          selectedIndex = 3;
                          setState(() {
                            if(selectedIndex == 3){
                              _animationController3.forward();
                            }
                            _animationController0.reverse();
                            _animationController1.reverse();
                            _animationController2.reverse();
                            _animationController4.reverse();
                          });
                        },
                        icon: AnimatedIcon(progress: _animationController3, icon: AnimatedIcons.pause_play,),
                        color: selectedIndex != 3 ? Colors.red.shade900 : Colors.red.shade50),
                    IconButton(
                        onPressed: () {

                          selectedIndex = 4;
                          setState(() {
                            if(selectedIndex == 4){
                              _animationController4.forward();
                            }
                            _animationController0.reverse();
                            _animationController1.reverse();
                            _animationController2.reverse();
                            _animationController3.reverse();
                          });
                        },
                        icon: AnimatedIcon(progress: _animationController4, icon: AnimatedIcons.add_event,),
                        color: selectedIndex != 4 ? Colors.red.shade900 : Colors.red.shade50),
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

class SquareShape extends CustomPainter {
  SquareShape({required this.index});

  final int index;

  void paintCircles(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red.shade50
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red.shade50
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.1, 0, size.width * 0.2, 0);
    path.quadraticBezierTo(
        size.width * 0.5, 0, size.width * 0.4, size.height * 0.3);

    path.arcToPoint(Offset(size.width * 0.6, size.height * 0.3),
        radius: const Radius.circular(10), clockwise: false);

    path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.8, 0);
    path.quadraticBezierTo(size.width * 0.9, 0, size.width, size.height * 0.2);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

    Paint paint1 = Paint()
      ..color = Colors.red.shade900
      // ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    var center;
    var icon1 = size.width * 0.113;
    var icon2 = size.width * 0.113 * 2.54;
    var icon3 = size.width * 0.113 * 2.54 * 2.488;
    var icon4 = size.width * 0.113 * 2.54 * 3.1;
    var height =  size.height * 0.515;
    var radius = 22.0;
    if (index == 0) {
       center = Offset(icon1, height);
       canvas.drawCircle(center, radius, paint1);
    }else if(index == 1){
      center= Offset(icon2,height);
      canvas.drawCircle(center, radius, paint1);
    }
    else if(index == 3){
      center= Offset(icon3, height);
      canvas.drawCircle(center, radius, paint1);
    }
    else if(index == 4){
      center= Offset(icon4, height);
      canvas.drawCircle(center, radius, paint1);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
