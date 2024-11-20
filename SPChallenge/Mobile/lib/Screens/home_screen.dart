import 'package:flutter/material.dart';
import 'package:spchallange/Componants/AppBar/app_bar.dart';
import 'package:spchallange/Screens/matches_screen.dart';
import 'package:spchallange/Screens/more_screen.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/l10n/l10n.dart';

import '../Themes/theme.dart';
import '../Widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    MatchesScreen(true),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Stream stream = localeController.stream;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      stream.listen((value) {
        setState(() {
          S.load(value);
        });
      });
    });
    return Directionality(
      textDirection: currentTextDir,
      child: Scaffold(
        // appBar: CustomAppBar(),
        backgroundColor: mainColor,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          backgroundColor: mainColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: S().home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stadium_outlined,
              ),
              label: S().matches,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              label: S().more,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
