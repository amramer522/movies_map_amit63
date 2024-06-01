import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LinesView extends StatelessWidget {
  const LinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextFormField(),
              // Container(
              //   clipBehavior: Clip.antiAlias,
              //   padding: EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16), color: Colors.grey.withOpacity(.2)),
              //   child: Stack(
              //     children: [
              //       Sparkline(
              //         lineColor: Colors.green,
              //         averageLine: true,
              //         data: [1, 5, 9, 2, 5, 4, 6, 9, 10, 1],
              //       ),
              //       Sparkline(
              //         lineColor: Colors.brown,
              //         averageLine: true,
              //         data: [11, 52, 9, 20, 5, 4, 16, 29, 10, 16],
              //       ),
              //     ],
              //   ),
              // ),
              // CircularCountDownTimer(
              //   duration: 200,
              //   isReverse: true,
              //   textFormat: CountdownTextFormat.MM_SS,
              //   fillColor: Colors.green,
              //   ringColor: Colors.grey.withOpacity(.2),
              //   height: 60,
              //   width: 60,
              // ),
              // CustomPaint(
              //   painter: MyPainter(),
              //   child: ClipOval(
              //     child: Image.network(
              //       "https://c.tadst.com/gfx/750w/un-intday-older-persons.jpg",
              //       height: 200,
              //       fit: BoxFit.cover,
              //       width: 200,
              //     ),
              //   ),
              // ),
              SizedBox(height: 10,),
              CustomPaint(
                painter: MyPainter(),
                child: Container(
                  height: 300,
                  width: 350,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


    path.lineTo(0, size.height *0.75);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70,   size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, size.height*0.90, size.width, 0);
    path.close();

    paint.color = Colors.orange;
    canvas.drawPath(path, paint);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}


class MyClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    var path = Path();

    double sideRadius = 30.0;
    double midPoint = size.height * (3/5);
    double cornerRadius = 20.0;

    path.moveTo(0, cornerRadius);
    path.lineTo(0, (midPoint - sideRadius));

    //LEFT ARC
    path.quadraticBezierTo(
        sideRadius, midPoint - sideRadius,
        sideRadius, midPoint
    );
    path.quadraticBezierTo(
        sideRadius, midPoint + sideRadius,
        0, midPoint + sideRadius
    );

    path.lineTo(0, size.height - cornerRadius);

    //BottomLeft
    path.quadraticBezierTo(
        0, size.height,
        cornerRadius, size.height
    );

    path.lineTo(size.width - cornerRadius, size.height);

    //BottomRight
    path.quadraticBezierTo(
        size.width, size.height,
        size.width, size.height - cornerRadius
    );

    path.lineTo(size.width, (midPoint + sideRadius));

    //RIGHT ARC
    path.quadraticBezierTo(
        (size.width - sideRadius), (midPoint + sideRadius),
        (size.width - sideRadius), (midPoint)
    );
    path.quadraticBezierTo(
        (size.width - sideRadius), (midPoint - sideRadius),
        size.width, midPoint - sideRadius
    );

    path.lineTo(size.width, cornerRadius);

    //TopRight
    path.quadraticBezierTo(
        size.width, 0,
        size.width - cornerRadius, 0
    );

    path.lineTo(cornerRadius, 0);

    //TopLeft
    path.quadraticBezierTo(
        0, 0,
        0, cornerRadius
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}