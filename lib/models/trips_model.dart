class TripsModel {
  String type;
  String label;
  String name;
  int distance;
  String bgPath;
  final List<String> tags;
  final List<String> additionalImages;
  String overviewBgPath;
  String description;
  double rating;

  TripsModel({
    required this.type,
    required this.label,
    required this.name,
    required this.distance,
    required this.bgPath,
    required this.tags,
    required this.additionalImages,
    required this.overviewBgPath,
    required this.description,
    required this.rating,
  }) {
    assert(tags.length == 2, '2 tags are required.');
    assert(additionalImages.length == 2, '2 images are required');
    }

  static List<TripsModel> getTrips() {
    List<TripsModel> trips = [];
    trips.add(
      TripsModel(
        type: 'Mount',
        label: "Daisen (いせ)",
        name: "Tottori Prefecture",
        distance: 17,
        bgPath: 'assets/images/trip_journal/daisen.png',
        tags: ["Mountain", "Spiritual"],
        additionalImages: ['assets/images/trip_journal/daisen.png', 'assets/images/trip_journal/daisen.png'],
        overviewBgPath: 'assets/images/overview_daisen.png',
        description: 'Absolutely breathtaking views! The hike was challenging but rewarding. Highly recommend visiting during the autumn for the vibrant foliage...',
        rating: 4.8,
      )
    );
    trips.add(
      TripsModel(
        type: 'River',
        label: "Ukai (鵜飼)",
        name: "Nagara River",
        distance: 60,
        bgPath: 'assets/images/trip_journal/ukai.png',
        tags: ["Cultural", "Fishing"],
        additionalImages: ["assets/images/trip_journal/ukai.png", 'assets/images/trip_journal/ukai.png'],
        overviewBgPath: 'assets/images/overview_daisen.png',
        description: '123',
        rating: 3.9,
      )
    );
    return trips;
  }
}

