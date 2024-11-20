import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spchallange/Componants/card_forgetpass/card_a_fb.dart';
import 'package:spchallange/Componants/card_forgetpass/card_c_fp.dart';
import 'package:spchallange/Componants/swiper_control.dart';

class ForgetPassWidget extends StatefulWidget {
  @override
  _ForgetPassWidgetState createState() => _ForgetPassWidgetState();
}

class _ForgetPassWidgetState extends State<ForgetPassWidget> {
  String first = "Forget";
  String second = "Password";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.pink,
                          Colors.blue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
                RichText(
                  textWidthBasis: TextWidthBasis.parent,
                  textScaleFactor: 2,
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(first,
                            style: GoogleFonts.courgette(
                                fontSize: 20, color: Colors.pink.shade800)),
                      ),
                    ),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(second,
                          style: GoogleFonts.courgette(
                              fontSize: 20, color: Colors.blue.shade800)),
                    )),
                  ]),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Swiper(
                onIndexChanged: (value) {
                  value = index;
                },
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, _) {
                  return IndexedStack(
                    index: index,
                    children: [
                      CardAFPScreen(goNext),
                      CardCFPScreen(),
                    ],
                  );
                },
                itemCount: 5,
                pagination: new SwiperPagination(
                  builder: SwiperPagination.rect,
                ),
                control: const CustomSwiperControl(padding: EdgeInsets.only()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  goNext() {
    if (index >= 0 && index <= 2) {
      setState(() {
        index = index + 1;
      });
    }
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
