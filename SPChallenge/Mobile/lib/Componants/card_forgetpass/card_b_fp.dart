import 'dart:async';

import 'package:flutter/material.dart';

import 'otpfp.dart';

class CardBFPScreen extends StatefulWidget {
  int index;
  Function goNext;
  CardBFPScreen(
    this.index,
    this.goNext,
  );
  @override
  _CardBFPScreenState createState() => _CardBFPScreenState();
}

int? idx;

Color x = Colors.white;
Color y = Colors.red;

Timer? _timer;
int _start = 10;

class _CardBFPScreenState extends State<CardBFPScreen> {
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            y = Colors.white;
          });
        } else {
          setState(() {
            _start--;
            //print(_start);
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
    if (idx == 1) {
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
                Colors.pink.shade300,
                Colors.blue,
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
                idx == 1 ? buildTimer() : Text(""),
                idx == 1 ? OtpFPForm(widget.goNext) : Text(""),
                GestureDetector(
                  onTap: () {
                    if (_start == 0) {
                      //add request here
                      startTimer();
                      setState(() {
                        _start = 10;

                        y = Colors.red;
                      });
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
            "00:${_start}",
            style: TextStyle(color: _start == 0 ? Colors.red : Colors.white),
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
