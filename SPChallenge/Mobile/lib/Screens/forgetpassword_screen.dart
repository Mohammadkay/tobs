import 'package:flutter/material.dart';
import 'package:spchallange/Screens/signin_screen.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Widgets/forgetpassword_widget.dart';

class ForgetPassScreen extends StatefulWidget {
  static const namedRout = '/forgetpassscreen';
  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  // Future<bool> _onBackpressed() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             actions: [
  //               FlatButton(
  //                   onPressed: () {
  //                     codeOTP1.text = "";
  //                     codeOTP2.text = "";
  //                     codeOTP3.text = "";
  //                     codeOTP4.text = "";
  //                     codeLE.text = "";
  //                     codeLP.text = "";
  //                     codeRE.text = "";
  //                     codeRP.text = "";
  //                     codeRN.text = "";
  //                     codePN.text = "";
  //                     Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (BuildContext context) =>
  //                                 SignInScreen()));
  //                   },
  //                   child: Text("Yes")),
  //               FlatButton(
  //                   onPressed: () {
  //                     Navigator.pop(context, false);
  //                   },
  //                   child: Text("No"))
  //             ],
  //           ));
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        codeFPE.text = '';
        codeFP.text = '';
        codeFP1.text = '';
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SignInScreen()));
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.blue,
                ),
                onPressed: () {
                  codeOTPFP1.text = "";
                  codeOTPFP2.text = "";
                  codeOTPFP3.text = "";
                  codeOTPFP4.text = "";
                  codeFPE.text = "";
                  codeFP.text = "";
                  codeFP1.text = "";

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignInScreen()));
                },
              ),
              centerTitle: true,
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        body: ForgetPassWidget(),
      ),
    );
  }
}
