import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Themes/theme.dart';

class CustomTextBox extends StatefulWidget {
  final String labelText;
  final String hint;
  final TextEditingController textEditingController;
  final int id;
  final String validationMessage;
  CustomTextBox(this.labelText, this.hint, this.textEditingController, this.id,
      this.validationMessage,
      {super.key});

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  final textFieldFocusNode = FocusNode();
  bool _isHidden = true;
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0.sp),
      child: TextFormField(
        controller: widget.textEditingController,
        //  onChanged: (val) => widget.textEditingController.text = val,
        cursorColor: mainColor,
        keyboardType:
            widget.id == 1 ? TextInputType.emailAddress : TextInputType.text,
        style: GoogleFonts.montserrat(
          color: mainColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        validator: (value) {
          if (value!.isNotEmpty &&
              widget.id == 1 &&
              validateEmail(value) == false) {
            return "Please enter that contains @ and .";
            //  return "الرجاء إدخال البريد الألكتروني بشكل صحيح";
          }
          // if (value.isNotEmpty &&
          //     widget.id == 2 &&
          //     validateStructure(value) == false) {
          //   return "الرجاء إدخال  (حروف - أرقام - رموز - أحرف كبيره) ";
          // }
          if (value.isEmpty) {
            return widget.validationMessage;
          }
          return null;
        },
        obscureText: widget.id == 2 ? _isHidden : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.id == 2
              ? IconButton(
                  color: mainColor,
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
            borderSide: BorderSide(width: 2.0.sp, color: Colors.red.shade400),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          errorStyle: TextStyle(color: Colors.white, fontSize: 14.0),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0.sp, color: Colors.red.shade400),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: BorderSide(width: 2.0.sp, color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(
            //     width: 2.0.sp, color: Colors.white, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: mainColor,
          ),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
