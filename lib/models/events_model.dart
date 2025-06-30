class Events {
  String name;
  String translate;
  String imgPath;
  DateTime time;
  double rating;

  Events({
    required this.name,
    required this.translate,
    required this.imgPath,
    required this.time,
    required this.rating,
  });

  static List<Events> getEvents(){
    List<Events> events = [];
    events.add(
      Events(
        name: "Ramen Night",
        translate: "(ラナト)",
        imgPath: 'assets/images/events/ramen_night.png',
        time: DateTime(2025, 5, 29, 12, 1),
        rating: 4.9,
      )
    );
    events.add(
      Events(
        name: "Kanda Matsuri",
        translate: "(ラト)",
        imgPath: 'assets/images/events/kanda_matsuri.png',
        time: DateTime(2025, 5, 22, 18, 0),
        rating: 4.8,
      )
    );
    events.add(
      Events(
        name: "Gion Matsuri",
        translate: "(祇園祭)",
        imgPath: 'assets/images/events/gion_matsuri.png',
        time: DateTime(2025, 5, 28, 22, 0),
        rating: 4.7,
      )
    );
    return events;
  }
}