import 'package:flutter/material.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Widgets/welcome_widget.dart';

import '../Themes/theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: currentTextDir,
        child:
            Scaffold(backgroundColor: mainColor, body: const WelcomeWidget()));
  }
}
