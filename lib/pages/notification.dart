import 'package:flutter/material.dart';
import 'package:travel_app/models/notifications_model.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationSet extends StatefulWidget {
  const NotificationSet({super.key});

  @override
  State<NotificationSet> createState() => _NotificationSetState();
}

class _NotificationSetState extends State<NotificationSet> {
  late List<Reminders> _reminders;
  late List<PlannedTrips> _plannedTrips;
  late List<TravelTips> _tips;
  late List<SafetyAlerts> _safetyAlerts;
  late List<PriceAlerts> _priceAlerts;

  @override
  void initState() {
    super.initState();
    _reminders = Reminders.getReminders();
    _tips = TravelTips.getTips();
    _safetyAlerts = SafetyAlerts.getSafetyAlerts();
    _priceAlerts = PriceAlerts.getPriceAlerts();
    _plannedTrips = PlannedTrips.getPlannedTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background2(),
        
        Padding(
          padding: const EdgeInsets.only(top: 133),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 123),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  alertTypeLabel("Trip reminders"),
            
                  buildNotifications(_reminders),
                  buildNotifications(_plannedTrips),
            
                  alertTypeLabel("AI Travel Tips"),
                  
                  buildNotifications(_tips),
            
                  alertTypeLabel("Weather & Safety Alerts"),
            
                  buildNotifications(_safetyAlerts),
            
                  alertTypeLabel("Price Drop Alerts"),
            
                  buildNotifications(_priceAlerts),
            
                ],
              ),
            ),
          ),
        ),
        CustomAppbar(text: "Notification"),
      ],
    );
  }

  Column alertTypeLabel(String label) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700, height: 1)),
        SizedBox(height: 20),
      ],
    );
  }

  Column buildNotifications(List notification) {
    return Column(
      children: notification.map((alert) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      color: (alert is SafetyAlerts) ? Color(0xFFFBE38D) : Color(0xFF99D4F1),
                      shape: BoxShape.circle,
                    ),
                    child: (alert is! PlannedTrips)
                    ? SvgPicture.asset(
                      alert.notifications.imgPath,
                      width: 17,
                      height: 17,
                    )
                    : ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(50),
                      child: Image.asset(
                        'assets/images/trip_journal/ukai.png',
                        width: 33,
                        height: 33,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  SizedBox(
                    width: 235,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(alert.notifications.label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
                        SizedBox(height: 3),
                        (alert is! PlannedTrips)
                          ? Text(alert.notifications.details, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF767676), height: 1.3, ))
                          : Container(
                            padding: EdgeInsets.only(bottom: 5, left: 5, top: 5, right: 12),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadiusGeometry.circular(13),
                                        child: Image.asset(
                                          alert.tripImgPath,
                                          width: 48,
                                          height: 48,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(alert.tripName, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w600, height: 1)),
                                        SizedBox(height: 6),
                                        Text(alert.plannedTime, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 11, fontWeight: FontWeight.w500, height: 1, color: Color(0xFF70739C))),
                                      ],
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  'assets/svg/dots.svg',
                                  width: 20,
                                  height: 20,

                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Text("${alert.notifications.time}h", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF70739C), height: 1))
            ],
          ),
        );
      }).toList(),
    );
  }
}