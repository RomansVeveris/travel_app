import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class Loved extends StatelessWidget{
  const Loved({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 0, 0, 0),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            'assets/svg/favourite.svg',
            width: 20,
            height: 20,
          )
        ),
      ),
    );
  }
}