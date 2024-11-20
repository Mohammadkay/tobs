import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spchallange/Share/global.dart';

class OtpFPForm extends StatefulWidget {
  Function goNext;
  OtpFPForm(this.goNext);
  @override
  _OtpFPFormState createState() => _OtpFPFormState();
}

class _OtpFPFormState extends State<OtpFPForm> {
  bool validte = false;
  submitForm() {
    if (codeOTPFP1.text.isEmpty ||
        codeOTPFP2.text.isEmpty ||
        codeOTPFP3.text.isEmpty ||
        codeOTPFP4.text.isEmpty) {
      setState(() {
        validte = true;
      });
    } else {
      codeOTPFP1.text = "";
      codeOTPFP2.text = "";
      codeOTPFP3.text = "";
      codeOTPFP4.text = "";

      validte = false;
      widget.goNext();
    }
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
                controller: codeOTPFP4,
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
                controller: codeOTPFP3,
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
                controller: codeOTPFP2,
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
                controller: codeOTPFP1,
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
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  submitForm();
                },
                child: Text(
                  "الإستمرار",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
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
