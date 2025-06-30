import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class Background1 extends StatelessWidget {
  const Background1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer( 
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(0.95 * pi / 4),
                  colors: [
                    Color(0xFF7DAFDC), 
                    Color.fromARGB(255, 253, 235, 183),
                    Color.fromARGB(0, 255, 255, 255),
                  ],
                  stops: [0.16, 0.4, 0.65],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                height: 335, 
                color: Color.fromARGB(3, 255, 255, 255), 
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/main_frame.svg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

class Background2 extends StatelessWidget {
  const Background2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer( 
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFDECB7), 
                    Color.fromARGB(0, 255, 255, 255),
                    ],
                  stops: [0.25, 0.95],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                height: 335, 
                color: Color.fromARGB(3, 255, 255, 255), 
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer( 
            child: ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF7DAFDC), 
                    Color.fromARGB(0, 255, 255, 255),
                    ],
                  stops: [0.1, 0.9],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcOver,
              child: Container(
                height: 335, 
                color: Color.fromARGB(3, 255, 255, 255), 
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/svg/light.svg',
            fit: BoxFit.fitWidth,
          ),
        ),
      ]
    );
  }
}