import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:spchallange/Share/global.dart';

import 'boxfp.dart';
import 'boxfpre.dart';

class CardCFPScreen extends StatefulWidget {
  @override
  _CardCFPScreenState createState() => _CardCFPScreenState();
}

var messagefp;
var status;

class _CardCFPScreenState extends State<CardCFPScreen> {
  final _formKeyes = GlobalKey<FormState>();
  submitForm() async {
    if (_formKeyes.currentState!.validate()) {
      _formKeyes.currentState!.save();
      // await Provider.of<GetData>(context, listen: false).resetPass(codeFP.text);

      // status = Provider.of<GetData>(context, listen: false).statusFP;
      // messagefp = Provider.of<GetData>(context, listen: false).messageFP;
      // Fluttertoast.showToast(
      //     msg: messagefp,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.blue,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
      // codeFP.text = '';
      // codeFP1.text = '';
      // codeFPE.text = '';
      // status == "success"
      //     ? Navigator.of(context).pushNamedAndRemoveUntil(LogInScreen.namedRout,
      //         (_) {
      //         return false;
      //       })
      //     : null;
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
                  Colors.pink.shade300,
                  Colors.blue,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.center,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Form(
            key: _formKeyes,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxFP("#@!Example: 123Pass", "الرجاء إدخال الحقل",
                      codeFP, "\tكلمة المرور الجديدة", 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxChPassFPRE("#@!Example: 123Pass",
                      "الرجاء إدخال الحقل", codeFP1, "تأكيد\tكلمة المرور", 2),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Container(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
            ),
          )),
    );
  }
}
