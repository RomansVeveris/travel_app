import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/pages/explore_gems.dart';
import 'dart:ui';
import 'package:travel_app/pages/home.dart';
import 'package:travel_app/pages/first_page.dart';
import 'package:travel_app/pages/place_overview.dart';
import 'package:travel_app/pages/plan_a_trip.dart';  
import 'package:travel_app/pages/trip_journal.dart';
import 'package:travel_app/controllers/screen_controller.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/pages/profile.dart';
import 'package:travel_app/pages/notification.dart';
import 'package:travel_app/pages/explore_booking.dart';
import 'package:travel_app/models/locals_model.dart';

final screenController = ScreenController();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  TripsModel? _selectedTrip;
  LocalsModel? _selectedLocal;

  @override
  void initState() {
    super.initState();
    screenController.bindCallback(onItemTapped);
    screenController.bindTripSelectCallback((trip) {
      setState(() {
        _selectedTrip = trip;
        _pageIndex = 3;
      });
    });
    screenController.bindLocalSelectCallback((local) {
      setState(() {
        _selectedLocal = local;
        _pageIndex = 6;
      });
    });
  }

  void onItemTapped(int index) {
    setState((){
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _screens = [
      MyScreen(),
      HomeScreen(),
      TripJournal(),
      _selectedTrip != null ? PlaceOverview(trip: _selectedTrip!) : Center(child:Text("Error loading trip.")),
      Profile(),
      NotificationSet(),
      _selectedLocal != null ? PlanATrip(local: _selectedLocal!) : Center(child:Text("Error loading local.")),
      ExploreGems(),
      ExploreBooking(),
    ];
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
        _screens[_pageIndex],
        if (_pageIndex != 0 && _pageIndex != 3) bottomFade(),
        if (_pageIndex != 3) customBottomNavBar(),
        ])
    );
  }

  Positioned customBottomNavBar() {
    double leftPos = _pageIndex * 71;

    return Positioned(
      bottom: 37,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        alignment: Alignment.center,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),  
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),  
            child: Container(
              width: 142,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha((0.65 * 255).round()), 
                borderRadius: BorderRadius.circular(26),
                border: Border.all(width: 1, color: Colors.white)
              ),
              child: Stack(
                
                children: [

                   AnimatedPositioned(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOutSine,
                    left: leftPos,
                    width: 69,
                    height: 66,
                    child: Container(
                      decoration: BoxDecoration(
                        color: (_pageIndex < 2 ) ? Colors.black : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                            setState(() {
                            onItemTapped(0);
                          });
                        },
                        child: Container(
                          height: 66,
                          width: 69,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/home.svg',
                            width: 24,
                            height: 24,
                            color: _pageIndex == 0 ? Colors.white : Colors.black,
                          )
                        ),
                      ),
                      
                      GestureDetector(
                        onTap: () {
                          onItemTapped(1);
                        },
                        child: Container(
                          height: 66,
                          width: 69,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/menu-square.svg',
                            key: const ValueKey('menu-square-svg'),
                            width: 24,
                            height: 24,
                            color: _pageIndex == 1 ? Colors.white : Colors.black
                            )
                        ),
                      ),
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned bottomFade() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        height: 93,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 174, 190, 204),
              Color.fromARGB(0, 212, 217, 222),
            ],
            stops: [0.0, 0.9],
          ),
        ),
      ),
    );
  }
}