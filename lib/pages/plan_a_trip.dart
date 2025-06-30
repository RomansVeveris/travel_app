import 'package:flutter/material.dart';
import 'package:travel_app/widgets/backgrounds.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/widgets/app_slider_shape.dart';
import 'package:travel_app/models/locals_model.dart';

class PlanATrip extends StatefulWidget {
  final LocalsModel local;
  const PlanATrip({super.key, required this.local});

  @override
  State<PlanATrip> createState() => _PlanATripState();
}

class _PlanATripState extends State<PlanATrip> {

  late TextEditingController controller;
  double amount = 1200.00;
  List<int> states = [0, 0, 0, 2, 0, 0, 0];
  double sliderValue = 200;
  List<bool> style = [true, false, false, false];

  void changeStyle(int category) {
    style = [false, false, false, false];
    setState(() {
      style[category] = true;
    });
  }

  double get currentAmount => amount;
  TextEditingController get textController => controller;

  void calculatePlan(double amount, states) {
    int daysCount = amount ~/ 275 - 1;
    if (amount < 200) { amount = 200; }
    else if (amount > 2000) { amount = 2000; }
    sliderValue = amount;
    for (int i=0; i<states.length; i++) {
      if (states[i] == 2) {
        for (int j=0; j<daysCount; j++) {
          if (i+j+1 < states.length) {
            states[i+j+1] = 1;
          }
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: amount.toStringAsFixed(2));
    controller.addListener(() {
      double? parsed = double.tryParse(controller.text.replaceAll('\$', ''));
      if (parsed != null) {
        if (parsed > 2000.00) {
          parsed = 2000.00;
          controller.value = TextEditingValue(
            text: "2000.00",
            selection: TextSelection.collapsed(offset: 8),
          );
        }
        setState((){
          amount = parsed!;
          for (int i=0; i<states.length; i++) {
            if (states[i] != 2) states[i] = 0;
          }
          calculatePlan(amount, states);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final week = List.generate(7, (i) => now.add(Duration(days: i)).day);

    final dayLetters = List.generate(7, (i) {
      final date = now.add(Duration(days: i));
      final shortDayName = DateFormat('E').format(date)[0];
      return shortDayName[0]; 
    });

    calculatePlan(amount, states);

    return Stack(
      children: [
        Background2(),
        
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 24, right: 24, top: 124, bottom: 124),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 77,
                  width: 327,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
          
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                          child: Image.asset(
                            'assets/images/plan_a_trip/map.png',
                            width: 327,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/place.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                  SizedBox(width: 8),
                                  Text("${widget.local.name}, Japan", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF0C125D))),
                                ],
                              ),
          
                              Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/svg/lines2.svg',
                                  width: 24.5,
                                  height: 17.5,
                                  color: Color(0xFF0D0F33),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
                SizedBox(height: 24,),
                Container(
                  padding: EdgeInsets.only(top: 28, bottom: 11),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 247, 255),
                    border: Border.all(width: 1, color: Color(0xFFD8E3EB)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [

                      containerTopText('Date & Budget', Color(0xFF1C90F9)),

                      SizedBox(height: 24),
          
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: week.asMap().entries.map((entry) {
                            final i = entry.key;
                            final date = entry.value;
                        
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (int j = 0; j < states.length; j++) {
                                    states[j] = 0;
                                  }
                                  states[i] = 2;
                                  calculatePlan(amount, states);
                                });
                              },
                              child: Column(
                                children: [
                                  Text(dayLetters[i], style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12, fontWeight: FontWeight.w500, height: 1)),
                                  SizedBox(height: 12),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: states[i] == 2
                                          ? Color(0xFF1084F1)
                                          : states[i] == 1
                                              ? Color.fromARGB(255, 224, 240, 255)
                                              : Color(0xFFEDF0F2),
                                      borderRadius: BorderRadius.circular(13),
                                      image: states[i] == 0 ? DecorationImage(
                                        image: AssetImage('assets/images/plan_a_trip/stripes.png'),
                                        fit: BoxFit.cover,
                                      ) : null,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 5.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("$date",style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w700, height: 1,
                                            color: states[i] == 2 ? Colors.white : Colors.black
                                          ),),
                                          SizedBox(height: 7),
                                          Divider(
                                            height: 0,
                                            thickness: 2,
                                            indent: 15,
                                            endIndent: 15,
                                            color: states[i] == 2 ? Colors.white : states[i] == 1 ? Color(0xFF1C90F9) : Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19.5),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Amount", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w400, height: 1),)
                          ),
                      ),
                        SizedBox(height: 10,),
          
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19.5),
                          child: TextField(
                            style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w500,),
                            textAlign: TextAlign.start,
                            controller: controller,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                              LengthLimitingTextInputFormatter(7), 
                            ],
                            decoration: InputDecoration(
                              prefixText: '\$',
                              hintText: "0.00",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD8E3EB), width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFD8E3EB), width: 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF9FAFB),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 19.5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [
                                  Text('\$200.00', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w500, height: 1),),
                                  Text('\$2000.00', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w500, height: 1),),
                                ],
                              ),
                            ),
                            SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xFF1C90F9),
                              inactiveTrackColor: Color(0xFFD9D9D9),
                              thumbShape: AppSliderShape(thumbRadius: 5),
                              tickMarkShape: SliderTickMarkShape.noTickMark,
                              trackShape: null,
                              valueIndicatorColor: Color(0xFFA4D3FD),
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontFamily: 'PlusJakartaSans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                              child: Slider(
                              value: sliderValue,
                              min: 200,
                              max: 2000,
                              divisions: 20,
                              label: '     \$${sliderValue.round()}.00     ',
                              onChanged: (double newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                  controller.text = sliderValue.round().toString();
                                  controller.text = sliderValue.toStringAsFixed(2);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFBF0),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Color(0xFFFDECC9))
                  ),
                  child: Column(
                    children: [
                      containerTopText('Travel Style', Color(0xFFF8BA0C)),

                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 34, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            travelStyle('assets/images/plan_a_trip/adventure.png', "Adventure", style[0], 0),
                            travelStyle('assets/images/plan_a_trip/solo.png', "Solo Travel", style[1], 1),
                            travelStyle('assets/images/plan_a_trip/road.png', "Road Trip", style[2], 2),
                            travelStyle('assets/images/plan_a_trip/family.png', "Family Tour", style[3], 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF71B6F5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text("Generate Itinerary", style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w700, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
        CustomAppbar(text: "Plan A Trip"),
      ],
    );
  }

  Column travelStyle(String imgPath, String text, bool selected, int id) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            changeStyle(id);
          },
          child: Container(
            alignment: Alignment.center,
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(15),
              border: selected ? Border.all(width: 1, color: Color(0xFFF8BA0C)) : null,
            ),
            child: Image.asset(
              imgPath,
              width: 51,
              height: 51,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontWeight: FontWeight.w600, fontSize: 10, height: 1)),
      ],
    );
  }

  Padding containerTopText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700, height: 1),),
          Text("Save", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 14, fontWeight: FontWeight.w500, color: color, height: 1),)
        ],
      ),
    );
  }
}