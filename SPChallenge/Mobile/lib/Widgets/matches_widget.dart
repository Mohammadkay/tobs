import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Screens/match_details_screen.dart';

class MatchesWidget extends StatefulWidget {
  final bool checkScreen;
  const MatchesWidget(this.checkScreen, {super.key});

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50.h,
        child: SizedBox(
          height: 50.h,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
                width: 45.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MatcheDetailsScreen()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'Assets/Images/card.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 45.w,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("Match 1 Today,",
                          style: TextStyle(color: Colors.white)),
                      Text("8:00 PM - 9:00 pm",
                          style: TextStyle(color: Colors.white)),
                      Text("MAHMOUD", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
