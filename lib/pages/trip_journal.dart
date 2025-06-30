import 'package:flutter/material.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/pages/main_screen.dart';
import 'dart:ui';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/widgets/loved.dart';
import 'package:travel_app/utils/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripJournal extends StatefulWidget {
  const TripJournal({super.key});

  @override
  State<TripJournal> createState() => _TripJournalState();
}

class _TripJournalState extends State<TripJournal> {
  late List<TripsModel> trips;
  int selectedCategory = 0;
  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
    _getTrips();
  }

  void _getTrips() {
    trips = TripsModel.getTrips();
  }

  void onCategorySelected(int item) {
    setState((){
      selectedCategory = item;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Background2(),

        Padding(
          padding: const EdgeInsets.only(top: 130),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 110),
            child: Column(
              children: [
                                                 
                displayType(),
                        
                SizedBox(height: 24),
                        
                TripList(),           
              ],                     
            ),
          ),
        ),
        CustomAppbar(text: "Trip Journal"),
      ],
    );
  }

  Column TripList() {
    return Column(
      children: trips.asMap().entries.map((entry) {
        final index = entry.key;
        final trip = entry.value;
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Container(
            height: 271,
            width: 327,
            decoration: BoxDecoration(
              color: const Color.fromARGB(17, 0, 0, 0),
              borderRadius: BorderRadius.circular(30),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Image.asset(
                  trip.bgPath,
                  fit: BoxFit.cover,
                  height: 271,
                ), 
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: ShaderMask(
                    shaderCallback: (rect){
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: const [0.4, 0.75]
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Image.asset(
                      trip.bgPath,
                      alignment: Alignment.bottomCenter,
                    )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color.fromARGB(108, 255, 209, 209),
                        Colors.transparent,
                      ],
                      stops: [0, 0.6]
                    )
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 22, right: 18, top: 18, bottom: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          screenController.selectTrip(trip);
                          screenController.setPageIndex(3);

                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(trip.label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white, height: 1)),
                            SizedBox(height: 10),
                            Text(trip.name, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, height: 1)),
                            SizedBox(height: 10),
                            Row(children: [
                              SvgPicture.asset(
                                'assets/svg/place.svg',
                                width: 14,
                                height: 14,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text("${trip.distance} Km to your location",style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white, height: 1))
                              
                              ]),
                            SizedBox(height: 16),
                            Row(children: [
                              
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: Color(0xFF043848),
                                ),
                                child: Text(trip.tags[0], style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white, height: 1))
                                ), 
                              SizedBox(width: 6),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: Color(0xFF043848),
                                ),
                                child: Text(trip.tags[1], style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white, height: 1.23))
                                ), 
                              ]
                            ),
                          ]
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(11),
                                  border: selectedImage == 0 ? BoxBorder.all(color: Colors.white, width: 2) : null, 
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(11),
                                  child: Image.asset(
                                    trip.additionalImages[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),

                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(11),
                                  border: selectedImage == 1 ? BoxBorder.all(color: Colors.white, width: 2) : null, 
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(11),
                                  child: Image.asset(
                                    trip.additionalImages[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),

                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(11),
                                  border: selectedImage == 1 ? BoxBorder.all(color: Colors.white, width: 2) : null, 
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children:  [
                                    ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(11),
                                    child: Image.asset(
                                      trip.additionalImages[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(103, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                  ),                                              
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('+10', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white, height: 1.23))
                                  ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                          Loved(),
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).horizontalAnimated(index: index)
        );
      }).toList(),
    );
  }

  Padding displayType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: EdgeInsets.all(6),
        height: 77,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () { onCategorySelected(0); },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: selectedCategory == 0 ? Color(0xFFF5F5F5) : Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/trip_journal/timeline.png',
                        height: 40,
                      ),
                      SizedBox(width: 8), 
                      Text("Timeline", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 6), 
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () { onCategorySelected(1); },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: selectedCategory == 1 ? Color(0xFFF5F5F5) : Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/trip_journal/storymode.png',
                        height: 40,
                      ),
                      SizedBox(width: 8),
                      Text("Storymode", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}