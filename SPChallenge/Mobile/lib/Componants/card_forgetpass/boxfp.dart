import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxFP extends StatefulWidget {
  final TextEditingController tec;
  final String hint;
  final String valed;
  final String title;
  final int id;
  BoxFP(
    this.hint,
    this.valed,
    this.tec,
    this.title,
    this.id,
  );

  @override
  _BoxFPState createState() => _BoxFPState();
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}

final textFieldFocusNoder = FocusNode();

class _BoxFPState extends State<BoxFP> {
  bool _isHidden = true;
  _visible() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
            controller: TextEditingController.fromValue(new TextEditingValue(
                text: widget.tec.text,
                selection: new TextSelection.collapsed(
                    offset: widget.tec.text.length))),
            onChanged: (val) => widget.tec.text = val,
            cursorColor: Colors.white,
            validator: (value) {
              if (value!.isNotEmpty && validateStructure(value) == false) {
                return "الرجاء إدخال  (حروف - أرقام - رموز - أحرف كبيره) ";
              }
              if (value.isEmpty) {
                return widget.valed;
              }
              return null;
            },
            keyboardType: TextInputType.text,
            obscureText: _isHidden,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            focusNode: textFieldFocusNoder,
            decoration: InputDecoration(
              prefixIcon: textFieldFocusNoder.hasFocus
                  ? IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.visibility_off),
                      onPressed: () {
                        _visible();
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
