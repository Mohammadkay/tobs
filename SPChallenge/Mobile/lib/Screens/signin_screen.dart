import 'package:flutter/material.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Widgets/signin_widget.dart';

import '../Componants/AppBar/app_bar.dart';
import '../Themes/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: currentTextDir,
      child: Scaffold(
        backgroundColor: mainColor,
        appBar: CustomAppBar(),
        body: const SignInWidget(),
      ),
    );
  }
}
