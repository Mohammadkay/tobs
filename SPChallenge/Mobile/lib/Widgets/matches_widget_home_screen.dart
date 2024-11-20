import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Screens/match_details_screen.dart';
import 'package:spchallange/Themes/theme.dart';
import 'package:spchallange/l10n/l10n.dart';

class MatchesWidgetHomeScreen extends StatefulWidget {
  final bool checkScreen;
  const MatchesWidgetHomeScreen(this.checkScreen, {super.key});

  @override
  State<MatchesWidgetHomeScreen> createState() =>
      _MatchesWidgetHomeScreenState();
}

class _MatchesWidgetHomeScreenState extends State<MatchesWidgetHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0.sp),
      child: Container(
        height: 30.h,
        //   margin: EdgeInsets.all(20.0.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 15.h,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatcheDetailsScreen()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0.sp),
                    topRight: Radius.circular(8.0.sp),
                  ),
                  child: Image.asset(
                    'Assets/Images/card.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
              width: 80.w,
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 15.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Match 1", style: TextStyle(color: mainColor)),
                          Text("Today ,8:00 PM - 9:00 pm",
                              style: TextStyle(color: mainColor)),
                          Text("MAHMOUD", style: TextStyle(color: mainColor)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                mainColor, // Sets color for all the descendant ElevatedButtons
                          ),
                          onPressed: () {
                            // Add button functionality here
                            print('Button Pressed!');
                          },
                          child: Text(
                            S().join,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
