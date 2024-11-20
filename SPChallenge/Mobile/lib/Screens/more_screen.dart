import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Themes/theme.dart';
import 'package:spchallange/Widgets/more_widget.dart';
import 'package:spchallange/main.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: currentTextDir,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: mainColor,
              title: Text(
                "More",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                  child: SizedBox(
                    child: const Image(
                      image: AssetImage("Assets/Images/fantasy.png"),
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
          backgroundColor: mainColor,
          body: MoreWidget()),
    );
  }
}
