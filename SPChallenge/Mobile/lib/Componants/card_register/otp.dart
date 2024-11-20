import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spchallange/Screens/signin_screen.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Themes/theme.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  bool validte = false;
  submitForm() {
    setState(() {
      if (codeOTP1.text.isEmpty ||
          codeOTP2.text.isEmpty ||
          codeOTP3.text.isEmpty ||
          codeOTP4.text.isEmpty) {
        validte = true;
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
        codeOTP1.text = "";
        codeOTP2.text = "";
        codeOTP3.text = "";
        codeOTP4.text = "";
        codeLE.text = "";
        codeLP.text = "";
        // codeRE.text = "";
        // codeRP.text = "";
        // codeRN.text = "";
        // codePN.text = "";
        validte = false;
      }
    });
  }

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                cursorColor: Colors.white,
                controller: codeOTP4,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
                focusNode: pin4FocusNode,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  pin4FocusNode!.unfocus();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  border: outlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                cursorColor: Colors.white,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                controller: codeOTP3,
                focusNode: pin3FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin4FocusNode);
                },
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  border: outlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                cursorColor: Colors.white,
                controller: codeOTP2,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                focusNode: pin2FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin3FocusNode);
                },
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  border: outlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                cursorColor: Colors.white,
                controller: codeOTP1,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
                autofocus: true,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin2FocusNode);
                },
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: validte == false
                        ? BorderSide(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid)
                        : BorderSide(
                            width: 2.0,
                            color: Colors.red,
                            style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  border: outlineInputBorder(),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: validte == true
                ? Text(
                    "الرجاء إدخال جميع الحقول",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                : Text(""),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () {
                  submitForm();
                },
                child: Text(
                  "الإستمرار",
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.white));
  }
}
