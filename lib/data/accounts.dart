class Accounts {
  String name;
  String surname;
  String avatarPath;
  final List<String> tags;
 
  Accounts({
    required this.name,
    required this.surname,
    required this.avatarPath,
    required this.tags,
  }) {
    assert(tags.length == 2, '2 tags are required.');
  }
}

class TravelProfile {
  final Accounts account;
  int countries;
  int mountains;
  int cities;

  TravelProfile({
    required this.account,
    required this.countries,
    required this.mountains,
    required this.cities,
  });

  static TravelProfile getProfile() {
    final travelProfile = TravelProfile(
      account: Accounts(
        name: "Romans",
        surname: "Veveris",
        avatarPath: 'assets/images/trip_journal/ukai.png',
        tags: ['Nomad', 'Explorer'],
      ),
      countries: 30,
      mountains: 93,
      cities: 69,
    );
    return travelProfile;
  }
}
