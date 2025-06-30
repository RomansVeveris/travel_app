import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

extension CardAnimation on Widget {
  Widget animatedCard({required int index}) {
    return this
      .animate()
      .fadeIn(duration: 600.ms, delay: (index * 100).ms, curve: Curves.easeOut)
      .slideY(begin: 0.3, duration: 600.ms);
  }
}

extension HorizontalAnimation on Widget {
  Widget horizontalAnimated({required int index}) {
    return this
      .animate()
      .fadeIn(duration: 600.ms, delay: (index * 150).ms, curve: Curves.easeOutSine)
      .slideX(begin: 0.15, duration: 800.ms);
  }
}

extension fadeInAnimation on Widget {
  Widget fadeInAnimateed() {
    return this
      .animate()
      .fadeIn(duration: 500.ms, curve: Curves.easeIn);
  }
}