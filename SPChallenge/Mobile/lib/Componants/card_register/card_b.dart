import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:spchallange/Componants/card_register/boxreg.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Themes/theme.dart';

class CardBScreen extends StatefulWidget {
  final Function goNext;
  CardBScreen(this.goNext);
  @override
  _CardBScreenState createState() => _CardBScreenState();
}

class _CardBScreenState extends State<CardBScreen> {
  final _formKey = GlobalKey<FormState>();
  submitForm() {
    if (_formKey.currentState!.validate()) {
      if (codeRPassword.text == codeRPConfirmPassword.text) {
        _formKey.currentState!.save();
        FocusScope.of(context).unfocus();
        widget.goNext();
      } else {
        AwsomeDialogDesign();
      }
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
                  child: BoxRG("#@!Example: 123Pass", "الرجاء إدخال الحقل",
                      codeRPassword, "\tكلمة المرور", 2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxRG("#@!Example: 123Pass", "الرجاء إدخال الحقل",
                      codeRPConfirmPassword, "\tتأكيد كلمة المرور", 2),
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

  AwsomeDialogDesign() {
    final ScrollController _scrollController = ScrollController();
    AwesomeDialog(
            closeIcon: Icon(
              Icons.close,
              color: mainColor,
            ),
            dialogBackgroundColor: Colors.white,
            context: context,
            borderSide: BorderSide(color: Color(0xFF4882A4), width: 2),
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: false,
            animType: AnimType.scale,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text("Passwords do not match"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    backgroundColor: mainColor,
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.only(right: 8, left: 8, top: 12, bottom: 12),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(fontFamily: 'Medium', fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            showCloseIcon: true,
            dialogType: DialogType.noHeader)
        .show();
  }
}
