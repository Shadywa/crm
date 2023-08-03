import 'package:flutter/cupertino.dart';

class CurveCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.9538750, size.height * 0.0438286);
    path0.quadraticBezierTo(size.width * 0.9840333, size.height * 0.0537571,
        size.width, size.height * 0.0729143);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * -0.0083333, size.height * 1.0028571);
    path0.lineTo(size.width * -0.0083333, size.height * 0.0842714);
    path0.quadraticBezierTo(size.width * 0.0048000, size.height * 0.0629571,
        size.width * 0.0180500, size.height * 0.0533143);
    path0.cubicTo(
        size.width * 0.0349833,
        size.height * 0.0439286,
        size.width * 0.0411167,
        size.height * 0.0403571,
        size.width * 0.0591667,
        size.height * 0.0385714);
    path0.quadraticBezierTo(size.width * 0.0953333, size.height * 0.0314429,
        size.width * 0.1639083, size.height * 0.0290571);
    path0.lineTo(size.width * 0.3219583, size.height * 0.0218571);
    path0.quadraticBezierTo(size.width * 0.4148583, size.height * 0.0186714,
        size.width * 0.4455500, size.height * 0.0180857);
    path0.cubicTo(
        size.width * 0.5871250,
        size.height * 0.0162000,
        size.width * 0.3141667,
        size.height * 0.0238286,
        size.width * 0.3630833,
        size.height * 0.0209857);
    path0.quadraticBezierTo(size.width * 0.3967583, size.height * 0.0166286,
        size.width * 0.6594083, size.height * 0.0190429);
    path0.quadraticBezierTo(size.width * 0.7854458, size.height * 0.0254929,
        size.width * 0.8274583, size.height * 0.0276429);
    path0.cubicTo(
        size.width * 0.8590625,
        size.height * 0.0316893,
        size.width * 0.8945583,
        size.height * 0.0316857,
        size.width * 0.9538750,
        size.height * 0.0438286);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
