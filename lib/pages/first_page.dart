import 'package:flutter/material.dart' hide SearchBar;
import 'package:travel_app/models/insights_model.dart';
import 'package:travel_app/models/locals_model.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/search_bar.dart';
import 'package:travel_app/pages/main_screen.dart';
import 'package:travel_app/utils/animations.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late List<InsightsModel> insights;
  late List<LocalsModel> locals;

  @override
  void initState() {
    super.initState();
    _getInsights();
    _getLocals();
  }

  void _getInsights() {
    insights = InsightsModel.getInsights();
  }

  void _getLocals() {
    locals = LocalsModel.getLocals();
  }

  @override
  Widget build(BuildContext context) {

      return Stack(
          children: [

            Background1(),
            
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 124),
                child: Column(
                  children: [
              
                    topText(),
                      
                    SizedBox(height: 19),
              
                    Container(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      height: 48,
                      child: SearchBar(hint: "Find places, food, Trips.."),
                    ),
                      
                    SizedBox(height: 32),
                    Column(
                      children: [
              
                        menuText("AI Insights Today"),
                      
                        
                        insightsList(),
              
                      ],
                    ),
                      
                    SizedBox(height: 28),
                    Column(
              
                      children: [
                        menuText("Locals by AI"),
              
                        SizedBox(height: 4),
              
                        localsList(),
              
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
  }

  SizedBox insightsList() {
    return SizedBox(
      height: 136,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: insights.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () {
              if (insights[index].name == 'Trending Destination') {
                screenController.setPageIndex(2);
              }
            },
            child: Container(
              width: 117,
              decoration: BoxDecoration(
                color: insights[index].boxColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      insights[index].iconPath,
                      width: 64,
                      fit: BoxFit.fitWidth,
                    ),
                
                    Text(
                      insights[index].name,
                      style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w600, height: 1.25),
                      softWrap: true,
                      textAlign: TextAlign.center, 
                    )
                  ],
                ),
              ),
            ).animatedCard(index: index)
          );
        },
      ),
    );
  }

  SizedBox localsList() {
    return SizedBox(
      height: 276,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: locals.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index){
          return Container(
            width: 189,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(31),
            ),
            clipBehavior: Clip.hardEdge,
            child: GestureDetector(
              onTap: () {
                screenController.selectLocal(locals[index]);
                screenController.setPageIndex(6);
              },
              child: Stack (
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      locals[index].bgPath,
                      fit: BoxFit.cover
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
                            locals[index].fadeColor, 
                          ],
                          stops: [0.0, 0.8],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left:24, top: 28),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(locals[index].name, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700, height: 1.12,),),
                        SizedBox(height: 6),
                        Text(locals[index].description, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w500, height: 1.12, color: locals[index].descColor),),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ).animatedCard(index: index);
        },
      ),
    );
  }

  Container menuText(String text) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      height: 30,
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 1.23,
          color: Color(0xFF121417),
        ),
      ),
    );
  }

  SizedBox topText() {
    return SizedBox(
      height: 184,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Ready to Explore",
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 28,
              fontWeight: FontWeight.w400,
              height: 1.23,
            ),
          ),
          Text(
            "Tokyo!",
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 36,
              fontWeight: FontWeight.w700,
              height: 1.23,
            ),
          ).fadeInAnimateed(),
          SizedBox(height: 21),
        ],
      ),
    );
  }
}

