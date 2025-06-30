import 'package:flutter/material.dart';

class AppSliderShape extends SliderComponentShape {
  final double thumbRadius;

  const AppSliderShape({required this.thumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
      required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow,
    }) {
      final Canvas canvas = context.canvas;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(0xFF1C90F9);

      final Rect rect = Rect.fromCenter(
        center: center,
        width: 22,
        height: 12,
      );

      final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));
      canvas.drawRRect(rrect, paint);

      final Paint innerPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = const Color.fromARGB(153, 255, 255, 255);

      final Rect innerRect = Rect.fromCenter(
        center: center,
        width: 8,
        height: 4,
      );
      
      final RRect innerRRect = RRect.fromRectAndRadius(innerRect, Radius.circular(2));
      canvas.drawRRect(innerRRect, innerPaint);
  }
}