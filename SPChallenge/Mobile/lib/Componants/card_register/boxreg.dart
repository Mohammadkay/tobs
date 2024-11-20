import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxRG extends StatefulWidget {
  final TextEditingController tec;
  final String hint;
  final String valed;
  final String title;
  final int id;
  BoxRG(
    this.hint,
    this.valed,
    this.tec,
    this.title,
    this.id,
  );

  @override
  _BoxRGState createState() => _BoxRGState();
}

final textFieldFocusNode = FocusNode();

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

class _BoxRGState extends State<BoxRG> {
  bool _isHidden = true;

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
            onTap: () {},
            controller: TextEditingController.fromValue(new TextEditingValue(
                text: widget.tec.text,
                selection: new TextSelection.collapsed(
                    offset: widget.tec.text.length))),
            onChanged: (val) => widget.tec.text = val,
            cursorColor: Colors.white,
            validator: (value) {
              if (value!.isNotEmpty &&
                  widget.id == 1 &&
                  validateEmail(value) == false) {
                return "الرجاء إدخال البريد الألكتروني بشكل صحيح";
              }
              if (value.isNotEmpty &&
                  widget.id == 2 &&
                  validateStructure(value) == false) {
                return "الرجاء إدخال  (حروف - أرقام - رموز - أحرف كبيره) ";
              }
              if (value.isEmpty) {
                return widget.valed;
              }
              return null;
            },
            keyboardType: widget.id == 1
                ? TextInputType.emailAddress
                : TextInputType.text,
            obscureText: widget.id == 2 ? _isHidden : false,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: widget.id == 2
                  ? IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                        if (textFieldFocusNode.hasFocus) {
                        } else {
                          textFieldFocusNode.canRequestFocus = false;
                        }
                      })
                  : null,
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
