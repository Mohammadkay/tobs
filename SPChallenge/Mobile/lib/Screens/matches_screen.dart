import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Componants/AppBar/app_bar_matches.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Widgets/matches_widget_home_screen.dart';
import '../Themes/theme.dart';
import '../Widgets/matches_widget.dart';
import 'package:spchallange/Componants/CustomPackges/custom_horizontal_calendar.dart';

class MatchesScreen extends StatelessWidget {
  final bool checkScreen;
  const MatchesScreen(this.checkScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return checkScreen
        ? Directionality(
            textDirection: currentTextDir,
            child: SafeArea(
              child: Scaffold(
                  // appBar: MatchesAppBar(),
                  backgroundColor: mainColor,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                          width: double.infinity,
                          child: HorizontalCalendar(
                            date: DateTime.now(),
                            initialDate: DateTime.now(),
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            selectedColor: mainColor,
                            showMonth: true,
                            locale: Localizations.localeOf(context),
                            onDateSelected: (date) {
                              // if (kDebugMode) {
                              //   print(date.toString());
                              // }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (BuildContext context, int index) {
                                return MatchesWidget(checkScreen);
                              }),
                        ),
                      ],
                    ),
                  )),
            ),
          )
        : Directionality(
            textDirection: currentTextDir,
            child: MatchesWidgetHomeScreen(checkScreen));
  }
}
