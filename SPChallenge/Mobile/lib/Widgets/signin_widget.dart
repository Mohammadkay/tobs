import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Screens/forgetpassword_screen.dart';
import 'package:spchallange/providers/getdata.dart';

import '../Componants/text_box.dart';
import '../Screens/home_screen.dart';
import '../Share/global.dart';
import '../Themes/theme.dart';
import 'package:provider/provider.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController textEditingControllerUserNameSignin =
      TextEditingController();
  TextEditingController textEditingControllerPasswordSignin =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingControllerUserNameSignin = TextEditingController();
    textEditingControllerPasswordSignin = TextEditingController();
  }

  final _formKeys = GlobalKey<FormState>();
  submitForm() async {
    if (_formKeys.currentState!.validate()) {
      await Provider.of<GetData>(context, listen: false).fetchLogIn(
          textEditingControllerUserNameSignin.text,
          textEditingControllerPasswordSignin.text);
      var status = Provider.of<GetData>(context, listen: false).statusLogIn;
      var message = Provider.of<GetData>(context, listen: false).messagelogin;

      if (status == "success") {
        prefs = await SharedPreferences.getInstance();
        var jsonFetchLogInResult =
            Provider.of<GetData>(context, listen: false).jsonFetchLogInResult;
        prefs!.setString('email', jsonFetchLogInResult!.email);
        print(prefs!.getString('email').toString());
        _formKeys.currentState!.save();

        textEditingControllerUserNameSignin = TextEditingController();
        textEditingControllerPasswordSignin = TextEditingController();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Fluttertoast.showToast(
          msg: "$message",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: mainColor,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: height,
          child: Form(
            key: _formKeys,
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.84,
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 25.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Text(
                    "Welcome back to SPChallange",
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: CustomTextBox(
                      "UserName",
                      "UserName",
                      textEditingControllerUserNameSignin,
                      0,
                      "Please enter the Value"),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: CustomTextBox(
                      "Password",
                      "Password",
                      textEditingControllerPasswordSignin,
                      2,
                      "Please enter the Value"),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgetPassScreen()));
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(fontSize: 11.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: Text(
                    "Dont have an acount? Register",
                    style: TextStyle(fontSize: 11.sp, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: width * 0.84,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1.5.sp)),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () async {
                      await submitForm();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 13.sp, color: mainColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
