import 'package:flutter/material.dart';
import 'package:spchallange/Componants/AppBar/app_bar_match_details.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Themes/theme.dart';

import '../Widgets/match_details_widget.dart';

class MatcheDetailsScreen extends StatelessWidget {
  const MatcheDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: currentTextDir,
      child: Scaffold(
          backgroundColor: mainColor,
          appBar: MatchesDetailsAppBar(),
          body: const MatcheDetailsWidget()),
    );
  }
}
