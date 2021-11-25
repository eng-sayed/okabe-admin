
import 'package:flutter/material.dart';

Widget nonet (BuildContext context) {
  return Center(
    child: Container(
      color: Color(0xFFFFFFFF),
      // decoration: ,
      child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height *
                    .01),
            Image.asset('images/nonet.jpg'),
            Center(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      MediaQuery
                          .of(context)
                          .size
                          .width,
                      MediaQuery
                          .of(context)
                          .size
                          .height *
                          .25,
                    ),
                    painter:
                    RPSCustomPainter(),
                  ),
                  const Center(
                    child: Text(
                      'No Internet Connection',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ),
  );
}
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.10,
        size.width * 0.50,
        size.height * 0.34);
    path_0.quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.11,
        size.width,
        size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate) {
    return true;
  }
}
