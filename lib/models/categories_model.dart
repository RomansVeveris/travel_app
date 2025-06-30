class CategoriesModel {
  final String label;
  bool selected;

  CategoriesModel({
    required this.label,
    required this.selected,
  });

  static List<CategoriesModel> getCategories() {
    List<CategoriesModel> categories = [];
    categories.add(
      CategoriesModel(label: "Must-See", selected: true)
    );
    categories.add(
      CategoriesModel(label: "Hidden Gem", selected: false)
    );
    categories.add(
      CategoriesModel(label: "Food & Cafe", selected: false)
    );
    categories.add(
      CategoriesModel(label: "Hidden gem", selected: false)
    );
    return categories;
  }

  static List<CategoriesModel> getGems() {
    List<CategoriesModel> gems = [];
    gems.add(
      CategoriesModel(label: "Street Food", selected: true)
    );
    gems.add(
      CategoriesModel(label: "Cultural Events", selected: false)
    );
    gems.add(
      CategoriesModel(label: "DIY Local Tours", selected: false)
    );
    gems.add(
      CategoriesModel(label: "Hidden Gem", selected: false)
    );
    return gems;
  }

  static List<CategoriesModel> getBooking() {
    List<CategoriesModel> booking = [];

    booking.add(
      CategoriesModel(label: "All", selected: true)
    );
    booking.add(
      CategoriesModel(label: "Hotel", selected: false)
    );
    booking.add(
      CategoriesModel(label: "Ryokan", selected: false)
    );
    booking.add(
      CategoriesModel(label: "Airbnb", selected: false)
    );
    return booking;
  }
}

