import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:spchallange/Componants/card_register/boxphone.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Themes/theme.dart';

class CardFScreen extends StatefulWidget {
  final Function goNext;
  CardFScreen(this.goNext);
  @override
  _CardFScreenState createState() => _CardFScreenState();
}

class _CardFScreenState extends State<CardFScreen> {
  static final _formKey = GlobalKey<FormState>();
  submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.goNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.grey.shade300,
                  mainColor,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.center,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxPhone("07xxxxxxxx", "الرجاء إدخال رقم التلفون",
                      codePNumber, "\ رقم التلفون"),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
            ),
          )),
    );
  }
}
