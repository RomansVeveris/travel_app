import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/animations.dart';

class SearchBar extends StatelessWidget{

  final String hint;
  const SearchBar({super.key, required this.hint});

  @override build(BuildContext context){
    final myBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFECEBEB), width: 1),
      borderRadius: BorderRadius.circular(50),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'PlusJakartaSans',
              color: Color(0xFF70739C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
              prefixIcon: SizedBox(
              width: 26,
              height: 26,
              child: Container(
                padding: const EdgeInsets.all(6),
                margin: EdgeInsets.only(left: 9),
                child: SvgPicture.asset(
                'assets/svg/find.svg',
                width: 26,
                height: 26,
                  ),
                ),
              ),
              enabledBorder: myBorder,
              focusedBorder: myBorder,

              filled: true,
              fillColor: Color.fromARGB(87,255,255,255),
            ),
          )
        ),
        SizedBox(width: 8),
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFECEBEB), width: 1),
            color: Color.fromARGB(87,255,255,255),
          ),
          child: SvgPicture.asset(
            'assets/svg/mic.svg',
            height: 22,
            width: 22,
          ),
        ),
      ],
    );
  }
}