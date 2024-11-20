import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Screens/home_screen.dart';
import 'package:spchallange/Screens/signup_screen.dart';
import 'package:spchallange/Themes/theme.dart';
import '../Screens/signin_screen.dart';
import '../Share/global.dart';
import '../providers/getdata.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  callData() async {
    await Provider.of<GetData>(context, listen: false).fetchSearchMatch();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  callData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      child: SizedBox(
        height: height,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
                width: double.infinity,
                child: Image.asset("Assets/Images/fantasy.png"),
              ),
              SizedBox(
                height: height * 0.3,
                width: double.infinity,
                child: Image.asset("Assets/Images/stadium.png"),
              ),
              SizedBox(
                width: width * 0.84,
                child: Text(
                  "Discover Your \nFootball Community",
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: width * 0.84,
                child: Text(
                  "Find players and games around you.",
                  style: TextStyle(fontSize: 13.sp, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Container(
                    width: width * 0.4,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                      color: Colors.white,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: width * 0.84,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    color: mainColor,
                    border: Border.all(color: Colors.white, width: 1.5.sp)),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Text(
                    'Continue as Guest',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
