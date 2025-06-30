import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:travel_app/models/categories_model.dart';
import 'package:travel_app/models/routes_model.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/search_bar.dart';
import 'package:travel_app/widgets/loved.dart';
import 'package:travel_app/widgets/category.dart';
import 'package:travel_app/widgets/category_name.dart';
import 'package:travel_app/utils/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CategoriesModel> categories;
  late List<RoutesModel> routes;
  late List<RoutesModel> routes0 = [];
  late List<RoutesModel> routes1 = [];

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getRoutes();
  }

  void _getCategories() {
    categories = CategoriesModel.getCategories();
  }

  void _getRoutes() {
    routes = RoutesModel.getRoutes();

    for(var route in routes) {
      if (route.category == 0) { routes0.add(route); }
      else if (route.category == 1) { routes1.add(route); }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        Background2(),

        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 57, bottom: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  height: 48,
                  child: SearchBar(hint: "Search by vibe, place, tag.."),
                ),
                    
                SizedBox(height:20),
                    
                Category(
                  categories: categories,
                  onCategorySelected: (int index) {
                    setState(() {
                      for (var cat in categories) { cat.selected = false; }
                      categories[index].selected = true;   
                    });
                  },
                ),
                    
                baseCampCard(),
                    
                CategoryName(name: "Must-See Today", index: 2),
            
                SizedBox(height: 12),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerLeft,
                  child: Text("AI Curated Route", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w400, height: 1, color: Color(0xFF121417))),
                ),
                SizedBox(height: 16),
                
                showRoutes(routes0),
                
                SizedBox(height: 24),
                    
                CategoryName(name: "Hidden Gems Nearby", index: 2),
                    
                SizedBox(height: 16),
                
                showRoutes(routes1),
                    
              ],
            ),
          ),
        ),
      ],
    );
  }

Padding baseCampCard() {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 28),
    child: Container(
      height: 189,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31),
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/routes/base_camp.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF1161AA),
                        const Color.fromARGB(0, 0, 0, 0),
                      ],
                      stops: const [0.3, 0.9],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Image.asset(
                    'assets/images/routes/base_camp.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(211, 12, 68, 121),
                      Color.fromARGB(33, 157, 204, 245),
                    ],
                    stops: [0, 0.6],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 17,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: SvgPicture.asset(
                        'assets/svg/lines.svg',
                        height: 18,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Find me base camp ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.35,
                            ),
                          ),
                          TextSpan(
                            text: 'nue of\nMount Takao',
                            style: TextStyle(
                              color: const Color(0xFFC6E7FD),
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ).fadeInAnimateed(),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.02,
                left: width * 0.4, 
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset('assets/svg/camp_mark.svg'),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/images/routes/camp_zoomed.png',
                        width: 28,
                        height: 28,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}


  SizedBox showRoutes(List<RoutesModel> routes) {
    return SizedBox(
      height: 205,
      child: ListView.separated(
        itemCount: routes0.length,
        padding: EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 9),
        itemBuilder: (context, index) {
          return Container(
            width: 159,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    routes[index].bgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(0, 255, 255, 255),
                          const Color.fromARGB(221, 23, 21, 9),
                        ],
                        stops: [0.1, 1]
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(routes[index].region, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
                      Text(routes[index].label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white))
                    ],
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Loved(),
                ),
              ],
            ).animatedCard(index: index),
          );
        }
      ),
    );
  }
}