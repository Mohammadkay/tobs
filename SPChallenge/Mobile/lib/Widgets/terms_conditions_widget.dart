import 'package:flutter/material.dart';

class TermsConditionsWidget extends StatefulWidget {
  const TermsConditionsWidget({super.key});

  @override
  State<TermsConditionsWidget> createState() => _TermsConditionsWidgetState();
}

class _TermsConditionsWidgetState extends State<TermsConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Terms Conditions")),
    );
  }
}
