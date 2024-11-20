import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spchallange/Componants/card_register/otp.dart';
import 'package:spchallange/Themes/theme.dart';

class CardEScreen extends StatefulWidget {
  final int index;
  CardEScreen(
    this.index,
  );
  @override
  _CardEScreenState createState() => _CardEScreenState();
}

int? idx;

Color x = Colors.white;

Timer? _timer;
int start = 10;

Color y = Colors.red;

class _CardEScreenState extends State<CardEScreen> {
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            y = Colors.white;
          });
        } else {
          setState(() {
            start--;
            //print(start);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  bool x1 = false;
  @override
  Widget build(BuildContext context) {
    setState(() {
      idx = widget.index;
    });
    if (idx == 8) {
      if (x1 == false) {
        startTimer();
        x1 = true;
      }
    }
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
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("التحقق من OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                Text(
                  "أرسلنا رمزك إلى 1866650+ ***",
                  style: TextStyle(color: Colors.white),
                ),
                idx == 8 ? buildTimer() : Text(""),
                idx == 8 ? OtpForm() : Text(""),
                GestureDetector(
                  onTap: () {
                    if (start == 0) {
                      //add request here
                      setState(() {
                        //not read new value
                        start = 10;
                        y = Colors.red;
                      });
                      startTimer();
                    } else {}
                  },
                  child: Text(
                    "إعادة إرسال رمز OTP",
                    style: TextStyle(
                        decoration: TextDecoration.underline, color: y),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RichText buildTimer() {
    return RichText(
      textWidthBasis: TextWidthBasis.parent,
      text: TextSpan(children: [
        WidgetSpan(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "00:${start}",
            style: TextStyle(color: start == 0 ? Colors.red : Colors.white),
          ),
        )),
        WidgetSpan(
          child: Text(
            "ستنتهي صلاحية هذا الرمز في  ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
