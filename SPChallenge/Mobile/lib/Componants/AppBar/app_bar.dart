import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Themes/theme.dart';

import '../../Screens/welcome_screen.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => WelcomeScreen()));
          },
          icon: Icon(Icons.arrow_back_ios_sharp)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SPChallange",
              style: GoogleFonts.courgette(fontSize: 20, color: mainColor)),
          Container(
              width: 60,
              height: 60,
              child: Image.asset("Assets/Images/fantasy.png")),
        ],
      ),
    );
  }
}
