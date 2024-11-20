import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxPhone extends StatefulWidget {
  final TextEditingController tec;
  final String hint;
  final String valed;
  final String title;

  BoxPhone(
    this.hint,
    this.valed,
    this.tec,
    this.title,
  );

  @override
  _BoxPhoneState createState() => _BoxPhoneState();
}

bool validatenumber(String value) {
  String pattern = r'^[0-9]*$';
  RegExp regex = RegExp(pattern);

  return (!regex.hasMatch(value)) ? false : true;
}

class _BoxPhoneState extends State<BoxPhone> {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              cursorColor: Colors.white,
              controller: widget.tec,
              validator: (value) {
                if (value!.isNotEmpty && value.length < 10) {
                  return "الرجاء إدخال 10 ارقام";
                }
                if (value.isNotEmpty && validatenumber(value) == false) {
                  return "الرجاء ادخال الرقم بشكل صحيح";
                }
                if (value.isEmpty) {
                  return widget.valed;
                }
                return null;
              },
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              keyboardType: TextInputType.phone,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.0, color: Colors.red.shade400),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                errorStyle: TextStyle(color: Colors.white, fontSize: 14.0),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.0, color: Colors.red.shade400),
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
                      width: 2.0,
                      color: Colors.white,
                      style: BorderStyle.solid),
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
          ),
        ],
      ),
    );
  }
}
