import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/widgets/custom_appbar.dart';
import 'package:travel_app/models/trips_model.dart';
import 'dart:ui';

class PlaceOverview extends StatelessWidget {
  final TripsModel trip;

  const PlaceOverview({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        overviewBackground(),

        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: 
            CustomAppbar(text: 'Place Overview'),
        ),
        
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(left:24, right: 24, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(trip.type, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 48, fontWeight: FontWeight.w300, color: Colors.white, height: 1.1)),
            
                Text(trip.label, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 52, fontWeight: FontWeight.w600, color: Colors.white, height: 1.1)),
            
                SizedBox(height: 15),
            
                Text(trip.description, style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white, height: 1.4)),
            
                SizedBox(height: 32),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Reviews", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, height: 1.2)),
                        SizedBox(height: 9),

                        Text("${trip.rating}", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white, height: 1.2)),

                        SizedBox(height: 6),

                        starRating(),

                        SizedBox(height: 6),

                        Text("1.2k reviews", style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 12.5, fontWeight: FontWeight.w300, color: Colors.white, height: 1.2))
                      ],
                    ),

                    continueBtn(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container continueBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 29, vertical: 23.5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF426171),),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 23,
            child: Text('CONTINUE', style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,), textAlign: TextAlign.center,)
            ),
          SvgPicture.asset(
            'assets/svg/arrow-up-right.svg',
            width: 23,
            height: 23,
            ),
        ],
      ),
    );
  }

  Row starRating() {
    return Row(
      children: List.generate(5, (index) {
        return SvgPicture.asset(
          index + 1 < trip.rating
            ? 'assets/svg/filled_star.svg'
            : 'assets/svg/unfilled_star.svg',
            width: 14,
            height: 14
        );
      })
    );
  }

  Positioned overviewBackground() {
    return Positioned.fill(
      child: 
      Stack(children: [
        Image.asset(
        trip.overviewBgPath,
        width: double.infinity,
        fit: BoxFit.cover,
        ),
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: ShaderMask(
            shaderCallback: (rect){
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: const [0.0, 0.9]
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: Image.asset(
              trip.overviewBgPath,
              alignment: Alignment.bottomCenter,
            )
          ),
        ),

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                const Color.fromARGB(223, 5, 45, 61),
                Color.fromARGB(207, 40, 66, 75),
                Colors.transparent,
              ],
              stops: [0.0, 0.3, 0.5]
            )
          ),
        ),
      ]),
    );
  }
}
