import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/pages/main_screen.dart';

class CustomAppbar extends StatelessWidget {
  final String text;

  const CustomAppbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    int index = screenController.pageIndex;
    return Padding(
      padding: const EdgeInsets.only(top: 57, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            
          GestureDetector(
            onTap: () {
              if (index < 3) { screenController.setPageIndex(--index); }
              else { screenController.setPageIndex(1); }
            },
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(127, 240, 243, 245),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/svg/back.svg',
                height: 24,
                )
            ),
          ),
          
          Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 20, fontWeight: FontWeight.w600)),
            
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            tooltip: 'Options',
            icon: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(127, 240, 243, 245),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/svg/dots.svg',
                height: 24,
              ),
            ),
            onSelected: (String value) {
              if (value == 'profile') {
                screenController.setPageIndex(4);
              } else if (value == 'notification') {
                screenController.setPageIndex(5);
              } else if (value == 'bookinghub') {
                screenController.setPageIndex(8);
              } else if (value == 'localgems') {
                screenController.setPageIndex(7);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'notification',
                child: Text('Notification'),
              ),
              const PopupMenuItem<String>(
                value: "localgems",
                child: Text("Local Gems"),
              ),
              const PopupMenuItem<String>(
                value: 'bookinghub',
                child: Text('Booking Hub'),
              ),
            ],
          )
        ],
      ),
    );
  }
}