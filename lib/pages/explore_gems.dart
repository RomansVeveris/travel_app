import 'package:flutter/material.dart';
import 'package:travel_app/models/categories_model.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/widgets/category.dart';
import 'package:travel_app/models/food_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/widgets/explore_main_text.dart';
import 'package:travel_app/utils/animations.dart';

class ExploreGems extends StatefulWidget {
  const ExploreGems({super.key});

  @override
  State<ExploreGems> createState() => _ExploreGemsState();
}

class _ExploreGemsState extends State<ExploreGems> {
  late List<CategoriesModel> categories;
  late List<FoodModel> foods;

  @override
  void initState() {
    super.initState();
    _getGems();
    _getFood();
  }

  void _getGems() {
    categories = CategoriesModel.getGems();
  }

  void _getFood() {
    foods = FoodModel.getFood();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background2(),

        Padding(
          padding: const EdgeInsets.only(top: 130),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 130),
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  ExploreMainText(text: "Local Gems Around You", desc: "Feel city's heartbeat through food & festivals."),
            
                  categoriesSelect(),
          
                  SizedBox(height: 17),
          
                  foodList(),
                ],
              ),
            ),
          ),
        ),
        CustomAppbar(text: "Explore"),
      ],
    );
  }

  Column foodList() {
    return Column(
      children: foods.asMap().entries.map((entry) {
        final index = entry.key;
        final food = entry.value;
        return Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
          child: Container(
            height: 226,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      food.imgPath,
                      height: 126,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 21.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name, style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w600, fontSize: 18, height: 1)),
                        SizedBox(height: 6,),
                        Text(food.desc, style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w400, fontSize: 12, height: 1, color: Color(0xFF70739C))),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/place.svg',
                              color: Color(0xFF19ABE5),
                              width: 14,
                              height: 14
                            ),
                            SizedBox(width: 6,),
                            Text(food.address, style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w500, fontSize: 10, color: Color(0xFF70739C))),
                            SizedBox(width: 9,),
                            SvgPicture.asset(
                              'assets/svg/filled_star.svg',
                              width: 14,
                              height: 14,
                              color: Color(0xFF1AABE5),
                            ),
                            SizedBox(width: 6,),
                            Text("${food.rating}k reviews", style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w400, fontSize: 10, color: Color(0xFF70739C))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).horizontalAnimated(index: index),
        );
      }).toList(),
    );
  }

  Category categoriesSelect() {
    return Category(
      categories: categories,
      onCategorySelected: (int index) {
        setState(() {
          for (var cat in categories) { cat.selected = false; }
          categories[index].selected = true;   
        });
      },
    );
  }
}
    