import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Themes/theme.dart';

class MatchesDetailsAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  MatchesDetailsAppBar({super.key});

  @override
  State<MatchesDetailsAppBar> createState() => _MatchesDetailsAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}

class _MatchesDetailsAppBarState extends State<MatchesDetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Match1",
              style: GoogleFonts.courgette(fontSize: 20, color: Colors.white)),
        ],
      ),
      actions: [
        Container(
            width: 60,
            height: 60,
            child:
                Image.asset("Assets/Images/fantasy.png", color: Colors.white)),
      ],
    );
  }
}
