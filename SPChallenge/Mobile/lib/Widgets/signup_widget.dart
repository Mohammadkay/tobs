import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Componants/card_register/card_a.dart';
import 'package:spchallange/Componants/card_register/card_b.dart';
import 'package:spchallange/Componants/card_register/card_c.dart';
import 'package:spchallange/Componants/card_register/card_d.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:spchallange/Componants/card_register/card_f.dart';
import 'package:spchallange/Componants/card_register/card_g.dart';
import 'package:spchallange/Componants/card_register/card_h.dart';
import 'package:spchallange/Componants/swiper_control.dart';
import 'package:spchallange/Themes/theme.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formKeys = GlobalKey<FormState>();
  // submitForm() async {
  //   if (_formKeys.currentState!.validate()) {
  //     await Provider.of<GetData>(context, listen: false).fetchRegister(
  //         textEditingControllerUserNameSignin.text,
  //         textEditingControllerPasswordSignin.text);
  //     var status = Provider.of<GetData>(context, listen: false).statusLogIn;
  //     var message = Provider.of<GetData>(context, listen: false).messagelogin;

  //     if (status == "success") {
  //       prefs = await SharedPreferences.getInstance();
  //       var jsonFetchLogInResult =
  //           Provider.of<GetData>(context, listen: false).jsonFetchLogInResult;
  //       prefs!.setString('email', jsonFetchLogInResult!.email);
  //       print(prefs!.getString('email').toString());
  //       _formKeys.currentState!.save();

  //       textEditingControllerUserNameSignin = TextEditingController();
  //       textEditingControllerPasswordSignin = TextEditingController();
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: "$message",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.white,
  //         textColor: mainColor,
  //         fontSize: 16.0,
  //       );
  //     }
  //   }
  // }

  final textEditingControllerEmail = TextEditingController();
  String name = "SPChallange";
  int index = 0;
  IconData? nullIconData =
      null; // Define a nullable IconData for no icon scenario

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
                          mainColor,
                          Colors.grey.shade300,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
                Positioned(
                  top: 40, // Adjust the top position as needed
                  left: 16, // Adjust the left position as needed
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      goBack();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Image.asset(
                    'Assets/Images/fantasy.png',
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Text(name,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white)),
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
                      CardAScreen(goNext),
                      CardBScreen(goNext),
                      CardCScreen(goNext),
                      CardDScreen(goNext),
                      CardFScreen(goNext),
                      CardGScreen(goNext),
                      CardHScreen(goNext),
                    ],
                  );
                },
                itemCount: 9,
                pagination: SwiperPagination(
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
    if (index >= 0 && index <= 8) {
      setState(() {
        index = index + 1;
      });
    }
  }

  goBack() {
    if (index > 0 && index <= 8) {
      setState(() {
        index = index - 1;
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
