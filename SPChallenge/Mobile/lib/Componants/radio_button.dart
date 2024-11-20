import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final int value;
  final Function(int?) onChanged;
  final int groupValue;
  CustomRadioButton(this.title, this.value, this.onChanged, this.groupValue,
      {super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: Row(
        children: <Widget>[
          Radio(
              activeColor: Colors.white,
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged),
          Text(
            widget.title,
            style: TextStyle(fontSize: 11.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
