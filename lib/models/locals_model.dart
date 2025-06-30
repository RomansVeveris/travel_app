import 'package:flutter/material.dart';
class LocalsModel {
  String name;
  String description;
  String bgPath;
  Color descColor;
  Color fadeColor;

  LocalsModel({ required this.name, required this.description, required this.bgPath, required this.descColor, required this.fadeColor});

  static List<LocalsModel> getLocals() {
    List<LocalsModel> locals = [];

    locals.add(
      LocalsModel(
        name: 'Mount Fuji',
        description: "富士信仰  (Fuji faith)",
        bgPath: 'assets/images/insights&locals/mount_fugi.png',
        descColor: Color(0xFF075583),
        fadeColor: Color.fromARGB(230, 207, 232, 253),
        )
    );
    locals.add(
      LocalsModel(
        name: 'Kiyomizu de',
        description: "清水寺 (Water Temple",
        bgPath: 'assets/images/insights&locals/kyo_de.png',
        descColor: Color(0xFFBC5208),
        fadeColor: Color.fromARGB(230, 250, 215, 88),
        )
    );
    return locals;
  }
}