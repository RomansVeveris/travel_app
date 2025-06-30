import 'package:flutter/material.dart';
import 'package:travel_app/pages/main_screen.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/data/accounts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.profile});
  final TravelProfile? profile;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TravelProfile _profile;

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  void _getProfile() {
    setState(() {
      _profile = TravelProfile.getProfile();
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
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 124),
              child: Column(
                children: [
                  Row(
                    children: [
                      profilePicture(),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${_profile.account.name} ${_profile.account.surname}", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 22, fontWeight: FontWeight.w700, height: 1)),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/place.svg',
                                width: 18,
                                height: 18,
                                color: Color(0xFF71B6F5),
                              ),
                              SizedBox(width: 8),
                              Text("17 Km from your location", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 13, fontWeight: FontWeight.w500, height: 1)),
                            ],
                          ),
                          SizedBox(height: 16),
            
                          Row(
                            children: [
                              createTag(_profile.account.tags[0], Color(0xFFF8BA0C)),
                              SizedBox(width: 4),
                              createTag(_profile.account.tags[1], Color(0xFF71B6F5)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 36),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileDetails('${_profile.countries}', 'Countries'),
                        divider(),
                        profileDetails('${_profile.mountains}', 'Mountain'),
                        divider(),
                        profileDetails('${_profile.cities}', 'Cities'),
                      ],
                    ),
                  ),
            
                  SizedBox(height: 28),
                  makeText("Your Travel Profile"),
                  SizedBox(height: 16),
            
                  
                  GestureDetector(
                    onTap:() {
                      screenController.setPageIndex(7);
                    },
                    child: navigationButtons('assets/images/profile/travel_manager.png', 'Travel Persona Manager', 'Foodie, Nomad, Explo...')
                    ),
          
                  navigationButtons('assets/images/profile/saved_places.png', 'Saved Places', '65 Destination Wanderlust'),
                  navigationButtons('assets/images/profile/saved_trips.png', 'Saved Trips', '8 Upcoming Trips'),
            
                  SizedBox(height: 12),
                  makeText("Your Preferences"),
                  SizedBox(height: 16),
            
                  GestureDetector(
                    onTap: () {
                      screenController.setPageIndex(5);
                    },
                    child: navigationButtons('assets/images/profile/notification.png', 'Notification', 'Trip Reminder, Golden'),
                  ),



                  navigationButtons('assets/images/profile/language.png', 'Language', 'English'),
            
                ],
              ),
            ),
          ),
        ),
        CustomAppbar(text: "Profile"),
      ],
    );
  }

  Container profilePicture() {
    return Container(
      width: 105,
      height: 114,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(24),
        child: Image.asset(
          _profile.account.avatarPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding navigationButtons(String imgPath, String label, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 14),
        height: 70,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  imgPath,
                  width: 46,
                  height: 46,
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
                    SizedBox(height: 8),
                    Text(desc, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w400, height: 1, color: Color(0xFF70739C))),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/svg/arrow_right.svg',
              width: 22,
              height: 22,
            ),
          ],
        ),
      ),
    );
  }

  Container makeText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700))
    );
  }

  SizedBox divider() {
    return SizedBox(
      height: 33,
      child: VerticalDivider(
        color: Color(0xFFD9D9D9),
        thickness: 2,
        width: 12,
      ),
    );
  }

  Column profileDetails(String number, String text) {
    return Column(
      children: [
        Text(number, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 32, fontWeight: FontWeight.w400, height: 1)),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 13, fontWeight: FontWeight.w500, height: 1))
      ],
    );
  }

  Container createTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8.5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w600, height: 1, color: Colors.white,))
    );
  }
}
