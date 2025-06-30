class NotificationsModel {
  String label;
  String details;
  String imgPath;
  int time;
  
  NotificationsModel({required this.label, required this.details, required this.imgPath, required this.time});
}
class Reminders{
  final NotificationsModel notifications;

  Reminders({required this.notifications});

  static List<Reminders> getReminders() {
    List<Reminders> reminders = [];

    reminders.add( 
      Reminders(
        notifications: NotificationsModel(
          label: 'Kyoto Zen (あなた) Hotel Check-in ',
          details: 'Check-in to your hotel in Osaka.',
          imgPath: 'assets/svg/hotel.svg',
          time: 1,
        )
      ),
    );
    return reminders;
  } 
}

class TravelTips{
  final NotificationsModel notifications;

  TravelTips({required this.notifications});

  static List<TravelTips> getTips() {
    List<TravelTips> tips = [];

    tips.add(
      TravelTips(
        notifications: NotificationsModel(
          label: "Explore Kyoto's Secret Gardens",
          details: "Discover hidden gems and local favorites.",
          imgPath: "assets/svg/gardens.svg",
          time: 13,
        )
      ),
    );
    tips.add(
      TravelTips(
        notifications: NotificationsModel(
          label: "Golden Hour in Kyoto is at 5:42 PM today",
          details: "Head to Arashiyama Bamboo..",
          imgPath: "assets/svg/clock.svg",
          time: 15,
        )
      ),
    );
    return tips;
  }
}

class PlannedTrips extends TravelTips {
  String tripName;
  String plannedTime;
  String tripImgPath;

  PlannedTrips({
    required this.tripName,
    required this.plannedTime,
    required this.tripImgPath,
    required String label,
    required String details,
    required String imgPath,
    required int time,
  }) : super(
          notifications: NotificationsModel(
            label: label,
            details: details,
            imgPath: imgPath,
            time: time,
          ),
        );

   static List<PlannedTrips> getPlannedTrips() {
    List<PlannedTrips> plannedTrips = [];
  
    plannedTrips.add(
      PlannedTrips(
        tripName: "Mount Daisen(いせ)",
        plannedTime: "May14-17",
        tripImgPath: "assets/images/trip_daisen.png",
        label: "Romans Veveris, you created a travel plan for the coming week..",
        details: "A trip has been created.",
        imgPath: "assets/images/ukai.png",
        time: 6,
      ),
    );
    return plannedTrips;
 }
}

class SafetyAlerts{
  final NotificationsModel notifications;

  SafetyAlerts({required this.notifications});

  static List<SafetyAlerts> getSafetyAlerts() {
    List<SafetyAlerts> safetyAlerts = [];

    safetyAlerts.add( 
      SafetyAlerts(
        notifications: NotificationsModel(
          label: "Okinawa Typhoon Alert",
          details: "Typhoon warning for Okinawa. Stay indoors.",
          imgPath: 'assets/svg/alert.svg',
          time: 48,
        )
      ),
    );
    return safetyAlerts;
  } 
}

class PriceAlerts{
  final NotificationsModel notifications;

  PriceAlerts({required this.notifications});

  static List<PriceAlerts> getPriceAlerts() {
    List<PriceAlerts> priceAlerts = [];

    priceAlerts.add( 
      PriceAlerts(
        notifications: NotificationsModel(
          label: "Sapporo Flight Prices",
          details: "Flights to Sapporo have decreased by 15%.",
          imgPath: 'assets/svg/discount.svg',
          time: 48,
        )
      ),
    );
    return priceAlerts;
  } 
}