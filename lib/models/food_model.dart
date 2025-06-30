class FoodModel {
  final String name;
  final String desc;
  final String address;
  final String imgPath;
  final double rating;

  FoodModel({
    required this.name,
    required this.desc,
    required this.address,
    required this.imgPath,
    required this.rating,
  });

  static List<FoodModel> getFood() {
    List<FoodModel> food = [];
    
    food.add(
      FoodModel(
        name: "Takoyaki (たこ焼き)",
        desc: "Octopus balls with crispy...",
        address: "Found in Osaka",
        imgPath: "assets/images/food/takoyaki.png",
        rating: 1.2,
      ),
    );
    food.add(
      FoodModel(
        name: "Tempura (天ぷら)",
        desc: "Crispy deep-fried vegetables and shrimp.",
        address: "Yanki Street",
        imgPath: "assets/images/food/tempura.png",
        rating: 1.8,
      ),
    );
    food.add(
      FoodModel(
        name: "Kushiyaki (串焼き)",
        desc: "Skewered meat grilled with tare sauce ...",
        address: "Yanki Street",
        imgPath: "assets/images/food/kushiyaki.png",
        rating: 1.8,
      ),
    );
    return food;
  }
}