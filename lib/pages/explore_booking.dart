import 'package:flutter/material.dart';
import 'package:travel_app/models/categories_model.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/widgets/category.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/widgets/explore_main_text.dart';
import 'package:travel_app/models/booking_model.dart';
import 'dart:ui';
import 'package:travel_app/widgets/category_name.dart';
import 'package:travel_app/models/events_model.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/utils/animations.dart';


class ExploreBooking extends StatefulWidget {
  const ExploreBooking({super.key});

  @override
  State<ExploreBooking> createState() => _ExploreBookingState();
}

class _ExploreBookingState extends State<ExploreBooking> {
  late List<CategoriesModel> categories;
  late List<BookingModel> hotels;
  late List<Events> events;
  late PageController _pageController;

  final timeTextStyle = TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 13, fontWeight: FontWeight.w500, height: 1, color: Color(0xFF70739C));

  @override
  void initState() {
    super.initState();
    _getBooking();
    _getHotels();
    _getEvents();
    _pageController = PageController(
      viewportFraction: 0.75,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _getBooking() {
    categories = CategoriesModel.getBooking();
  }

  void _getHotels() {
    hotels = BookingModel.getHotel();
  }

  void _getEvents() {
    events = Events.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background2(),

        Padding(
          padding: const EdgeInsets.only(top: 130),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 130),
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExploreMainText(text: "Booking Hub", desc: "Personalized bookings for your Japan Journey"),
            
                  categoriesSelect(),
            
                  SizedBox(height: 28),
            
                  showHotelsList(),

                  SizedBox(height: 20),
                  CategoryName(name: "Local Events", index: 0),
                  SizedBox(height: 16),

                  showLocalEvents(),
                ],
              ),
            ),
          ),
        ),
        CustomAppbar(text: "Explore"),
      ],
    );
  }

  SizedBox showHotelsList() {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: _pageController,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = (_pageController.page! - index).abs();
                value = (1 - (value * 0.3)).clamp(0.8, 1.0);
              }

              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            hotels[index].imgPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(21),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(21),
                                          color: const Color.fromARGB(26, 0, 0, 0),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svg/filled_star.svg',
                                              width: 12,
                                              height: 12,
                                              color: Color(0xFFF8BA0C),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "${hotels[index].rating.toStringAsFixed(1)}",
                                              style: TextStyle(
                                                fontFamily: 'PlusJakartaSans',
                                                fontSize: 9,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                height: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipOval(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        width: 39,
                                        height: 39,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(50, 0, 0, 0),
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/svg/favourite.svg',
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(21),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 14.5, top: 14.5, right: 13, bottom: 13),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color.fromARGB(50, 75, 145, 164)),
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color.fromARGB(31, 255, 255, 255),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotels[index].name,
                                          style: TextStyle(
                                            fontFamily: 'PlusJakartaSans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            height: 1,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/place.svg',
                                                      width: 12,
                                                      height: 12,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      hotels[index].address,
                                                      style: TextStyle(
                                                        fontFamily: 'PlusJakartaSans',
                                                        fontSize: 9,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.white,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 6),
                                                Text("\$${hotels[index].price.toStringAsFixed(2)}", style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w600, color: Colors.white, height: 1, fontSize: 16)),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(21),
                                                color: Color(0xFFF8BA0C),
                                              ),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                  fontFamily: 'PlusJakartaSans',
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  height: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Column showLocalEvents() {
    return Column(
      children: events.asMap().entries.map((entry) {
        final index = entry.key;
        final event = entry.value;
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
          child: Container(
            padding: EdgeInsets.all(8),
            height: 121,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Color.fromARGB(255, 241, 241, 241),
            ),
            child: Row(
              children: [
                Image.asset(
                  event.imgPath,
                  width: 97,
                  fit: BoxFit.cover
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${event.name} ", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 20, fontWeight: FontWeight.w700, height: 1,)),
                        Text(event.translate, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w300, height: 1,)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/calendar.svg',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 4,),
                        Text(
                          "${DateFormat.MMM().format(event.time)} ${event.time.day} • ${DateFormat('hh:mm a').format(event.time)}", style: timeTextStyle),
                      ],                            
                    ),
                    SizedBox(height: 12,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Color(0xFF71B6F5),
                      ),
                      child: Text("Get Ticket", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w600, height: 1, color: Colors.white,)),
                    ),
                  ],
                ),
              ],
            ),
          ).horizontalAnimated(index: index),
        );
      }).toList(),
    );
  }

    Category categoriesSelect() {
    return Category(
      categories: categories,
      onCategorySelected: (int index) {
        setState(() {
          for (var cat in categories) { cat.selected = false; }
          categories[index].selected = true;   
        });
      },
    );
  }
}