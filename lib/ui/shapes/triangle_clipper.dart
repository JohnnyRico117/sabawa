import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();

    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - size.height, size.height);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
