class BookingModel {
  String name;
  String address;
  double price;
  double rating;
  String imgPath;

  BookingModel({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
    required this.imgPath
  });

  static List<BookingModel> getHotel() {
    List<BookingModel> hotels = [];

    hotels.add(
      BookingModel(
        name: "Kyoto Zen (あなた)",
        address: "Gion District, Kyoto",
        price: 150.00,
        rating: 4.9,
        imgPath: "assets/images/kyoto_hotel.png",
      )
    );

    hotels.add(
      BookingModel(
        name: "Kyoto Zen (あなた)",
        address: "Gion District, Kyoto",
        price: 150.00,
        rating: 4.9,
        imgPath: "assets/images/kyoto_hotel.png",
      )
    );
    return hotels;
  }
}