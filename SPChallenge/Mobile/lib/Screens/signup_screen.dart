import 'package:flutter/material.dart';
import 'package:spchallange/Services/environment.dart';
import '../Componants/AppBar/app_bar.dart';
import '../Themes/theme.dart';
import '../Widgets/signup_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: currentTextDir,
      child: Scaffold(
        backgroundColor: mainColor,
        // appBar: CustomAppBar(),
        body: SignUpWidget(),
      ),
    );
  }
}
