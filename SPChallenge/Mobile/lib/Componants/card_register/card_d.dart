import 'package:flutter/material.dart';
import 'package:spchallange/Componants/card_register/boxname.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Themes/theme.dart';

class CardDScreen extends StatefulWidget {
  final Function goNext;
  CardDScreen(this.goNext);
  @override
  _CardDScreenState createState() => _CardDScreenState();
}

class _CardDScreenState extends State<CardDScreen> {
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
                  child: BoxRGName(
                    "First Name",
                    "الرجاء إدخال الحقل",
                    codeRFirstName,
                    "\ الأسم الأول",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxRGName(
                    "Last Name",
                    "الرجاء إدخال الحقل",
                    codeRLastName,
                    "\ الأسم الأخير",
                  ),
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
