import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:spchallange/Componants/card_forgetpass/boxemailfp.dart';
import 'package:spchallange/Share/global.dart';

class CardAFPScreen extends StatefulWidget {
  Function goNext;
  CardAFPScreen(this.goNext);
  @override
  _CardAFPScreenState createState() => _CardAFPScreenState();
}

String? phoneFP;
bool focus = true;
var status;
var message;

class _CardAFPScreenState extends State<CardAFPScreen> {
  final _formKey = GlobalKey<FormState>();
  submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      // await Provider.of<GetData>(context, listen: false).getPhone(codeFPE.text);
      // status = Provider.of<GetData>(context, listen: false).statusgetPhone;
      // message = Provider.of<GetData>(context, listen: false).messagegetPhone;
      // phoneFP = Provider.of<GetData>(context, listen: false).phoneFP;
      // if (status == "success") {
      //   final timeOut = Duration(minutes: 2);
      //   final _phoneNumber =
      //       "+962" + phoneFP.toString().substring(1, phoneFP.length);
      //   //print(_phoneNumber);
      //   final PhoneVerificationCompleted _verified =
      //       (AuthCredential credential) async {
      //     await _ver(credential);
      //   };
      //   final PhoneVerificationFailed verificationfailed =
      //       (FirebaseAuthException authException) {
      //     //print("verfied Faild");
      //     //print(authException.toString());
      //   };
      //   final PhoneCodeSent smsSent = (String verId, [int forceResend]) async {
      //     final onDone = (String text) async {
      //       AuthCredential credential = PhoneAuthProvider.credential(
      //           verificationId: verId, smsCode: text);
      //       await _ver(credential);
      //     };

      //     await Navigator.push(
      //         context,
      //         MaterialPageRoute<Null>(
      //             builder: (c) =>
      //                 CodeVerification(onDone, timeOut, _phoneNumber),
      //             fullscreenDialog: true));
      //     focus = false;
      //   };

      //   final PhoneCodeAutoRetrievalTimeout autoTimeout = (ver) {
      //     ///
      //     //Navigator.of(context).pop();
      //   };
      //   /*  FirebaseAuth.instance.signInWithPhoneNumber(phoneNumber).then((value) {
      //                PhoneAuthProvider.credential(verificationId:  value.verificationId, smsCode: null)

      //                })*/
      //   await FirebaseAuth.instance.verifyPhoneNumber(
      //       phoneNumber: _phoneNumber,
      //       timeout: timeOut,
      //       verificationCompleted: _verified,
      //       verificationFailed: verificationfailed,
      //       codeSent: smsSent,
      //       codeAutoRetrievalTimeout: autoTimeout);
      // } else {
      //   Fluttertoast.showToast(
      //       msg: message,
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.blue,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }
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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BoxEmailFP(focus, "@Example: User",
                      "الرجاء إدخال الحقل", codeFPE, "\tالبريد الإلكتروني", 1),
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

//   Future<void> _ver(AuthCredential credential) async {
//     String res;
//     if (credential != null) {
//       try {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         res = "succs";
//       } catch (e) {
//         //print("e : " + e.toString());
//         if (e is FirebaseAuthException) {
//           res = e.code;
//         } else {
//           res = "wrong";
//         }
//       }
//     } else {
//       res = "wrong";
//     }
//     bool succs = res == "succs";
//     String msg;
//     if (!succs) {
//       msg = res == "invalid-verification-code"
//           ? "رمز التحقق خطئ"
//           : res == "session-expired"
//               ? "انتهت صلاحة الرمز المرسل"
//               : res == "too-many-requests"
//                   ? "حاولت العديد من المرات يرجى المحاوله لاحقا"
//                   : "حدث خطأ ما";
//     }
//     if (res != "invalid-verification-code") Navigator.of(context).pop();
//     if (succs) {
//       widget.goNext();
//     }
//     Fluttertoast.showToast(
//         msg: succs ? "تم بنجاح" : msg,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.blue,
//         textColor: Colors.white,
//         fontSize: 16.0);
// // Navigator.of(context)
// //     .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
//   }
}
