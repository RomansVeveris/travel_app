// categories:
// 1 -> Must-See Today
// 2 -> Hidden Gems Nearby
// 3 -> Food & Cafe
class RoutesModel {
  String label;
  String region;
  int category;
  String bgPath;

  RoutesModel({required this.label, required this.region, required this.category, required this.bgPath});

  static List<RoutesModel> getRoutes() {
    List<RoutesModel> routes = [];

    routes.add(
      RoutesModel(
        label: "Cherry Blossoms",
        region: "Torii Gate",
        category: 0,
        bgPath: 'assets/images/routes/0_cherry_blossoms.png'
      )
    );
    routes.add(
      RoutesModel(
        label: "Mount Fuji",
        region: "Shizuoka Region",
        category: 0,
        bgPath: 'assets/images/routes/0_mount_fuji.png'
      )
    );
    routes.add(
      RoutesModel(
        label: "Summit Senority",
        region: "Kansai Region",
        category: 1,
        bgPath: 'assets/images/routes/1_summit_senority.png'
      )
    );
    routes.add(
      RoutesModel(
        label: "Hiei Temple",
        region: "Niseko Region",
        category: 1,
        bgPath: 'assets/images/routes/1_hiei_temple.png'
      )
    );
    return routes;
  }
}

