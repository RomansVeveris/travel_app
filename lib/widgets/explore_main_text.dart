import 'package:flutter/material.dart';

class ExploreMainText extends StatelessWidget {
  final String text;
  final String desc;

  const ExploreMainText({required this.text, required this.desc, super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w700, height: 1)),
          SizedBox(height: 18),
          Text(desc, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w400, height: 1)),
          SizedBox(height: 20),
        ],
      ),
    );
  }

}