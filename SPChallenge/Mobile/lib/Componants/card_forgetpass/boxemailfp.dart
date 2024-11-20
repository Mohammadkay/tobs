import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxEmailFP extends StatefulWidget {
  bool focus;
  final TextEditingController tec;
  final String hint;
  final String valed;
  final String title;
  final int id;
  BoxEmailFP(
    this.focus,
    this.hint,
    this.valed,
    this.tec,
    this.title,
    this.id,
  );
  @override
  _BoxEmailFPState createState() => _BoxEmailFPState();
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool autoFocus = true;

class _BoxEmailFPState extends State<BoxEmailFP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                widget.title,
                style: GoogleFonts.tajawal(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          TextFormField(
            textInputAction: TextInputAction.done,
            autofocus: widget.focus,
            onTap: () {},
            controller: TextEditingController.fromValue(new TextEditingValue(
                text: widget.tec.text,
                selection: new TextSelection.collapsed(
                    offset: widget.tec.text.length))),
            onChanged: (val) => widget.tec.text = val,
            cursorColor: Colors.white,
            validator: (value) {
              if (value!.isNotEmpty && validateEmail(value) == false) {
                return "الرجاء إدخال البريد الألكتروني بشكل صحيح";
              }

              if (value.isEmpty) {
                return widget.valed;
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.red.shade400),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              errorStyle: TextStyle(color: Colors.white, fontSize: 14.0),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.red.shade400),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2.0, color: Colors.white, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
