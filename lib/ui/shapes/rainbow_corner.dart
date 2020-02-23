import 'package:flutter/material.dart';

import 'package:sabawa/ui/shapes/triangle_clipper.dart';

class RainbowCorner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.215,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFEC612),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFCA318),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.185,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFE781B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFFB431C),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.155,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF71518),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFEC0672),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.125,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFC81B9B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.11,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF9B269B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.095,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF6B2B9B),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF333099),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF1B4AA2),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF046FB5),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.035,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF0094CC),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF03A6DD),
            ),
          ),
        ),
      ],
    );
  }

}