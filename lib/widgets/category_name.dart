import 'package:flutter/material.dart';
import 'package:travel_app/pages/main_screen.dart';


class CategoryName extends StatelessWidget {
  final String name;
  final int index;

  const CategoryName({required this.name, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700, height: 1)),
          GestureDetector(
            onTap: () {
                screenController.setPageIndex(index);
              },
            child: Text("See All", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w500,height: 1,color: Color(0xFF12487F))),
          ),
        ],
      ),
    );
  }
}