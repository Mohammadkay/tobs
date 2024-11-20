import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxRGName extends StatefulWidget {
  final TextEditingController tec;
  final String hint;
  final String valed;
  final String title;
  BoxRGName(
    this.hint,
    this.valed,
    this.tec,
    this.title,
  );

  @override
  _BoxRGNameState createState() => _BoxRGNameState();
}

class _BoxRGNameState extends State<BoxRGName> {
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
              if (value!.isEmpty) {
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
