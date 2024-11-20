import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Widgets/matches_widget.dart';
import 'package:spchallange/l10n/l10n.dart';

import '../Componants/swiper.dart';
import '../Screens/matches_screen.dart';
import '../Share/global.dart';
import '../Themes/theme.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: currentTextDir,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                child: SizedBox(
                  width: 40.w,
                  height: 8.h,
                  child: const Image(
                    image: AssetImage("Assets/Images/fantasy.png"),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 30.h,
                width: double.infinity,
                child: CustomSwiper(),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.6,
                      child: Text(
                        S().upcomingMatches,
                        style: TextStyle(fontSize: 15.sp, color: Colors.white),
                      ),
                    ),
                    // SizedBox(
                    //   width: 25.w,
                    //   height: 5.1.h,
                    //   child: Container(
                    //     clipBehavior: Clip.antiAlias,
                    //     decoration: BoxDecoration(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10.sp)),
                    //         color: Colors.white,
                    //         border:
                    //             Border.all(color: Colors.white, width: 0.1.sp)),
                    //     child: TextButton(
                    //       style: ButtonStyle(
                    //         foregroundColor:
                    //             MaterialStateProperty.all<Color>(Colors.white),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => MatchesScreen(true)));
                    //       },
                    //       child: Text(
                    //         'SEE ALL',
                    //         style: TextStyle(fontSize: 10.sp, color: mainColor),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 85.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return MatchesScreen(false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
