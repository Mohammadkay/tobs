import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spchallange/Models/registerModel.dart';
import 'package:spchallange/Share/global.dart'; // Import your global.dart for constants
import 'package:spchallange/Themes/theme.dart'; // Import your theme.dart for colors
import 'package:spchallange/Screens/signin_screen.dart';
import 'package:provider/provider.dart';
import 'package:spchallange/main.dart';
import '../../providers/getdata.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class CardHScreen extends StatefulWidget {
  final Function goNext;
  CardHScreen(this.goNext);

  @override
  _CardHScreenState createState() => _CardHScreenState();
}

class _CardHScreenState extends State<CardHScreen> {
  static final _formKey = GlobalKey<FormState>();

  submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (selectedGender != null) {
        AwsomeDialogDesign();
      } else {
        AwsomeDialogDesignError();
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
              mainColor, // Replace with your mainColor from theme.dart
            ],
            begin: Alignment.bottomRight,
            end: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Radio Buttons for Position Selection
              RadioListTile<int>(
                title: Text(
                  'Male',
                  style: TextStyle(color: Colors.white),
                ),
                value: 1,
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              RadioListTile<int>(
                title: Text(
                  'Female',
                  style: TextStyle(color: Colors.white),
                ),
                value: 2,
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),

              // Continue Button
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      color:
                          mainColor, // Replace with your mainColor from theme.dart
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: mainColor)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DraggableScrollbar.rrect(
                      controller: _scrollController,
                      backgroundColor: mainColor,
                      alwaysVisibleScrollThumb: true,
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                  "1.	لا يتم تقديم أي خدمة من خدمتنا إلا بعد دفع المبلغ كاملاً. \n 2.	الأسعار بالموقع تعتبر ثابتة ولا يمكن تخفيضها إلا في أوقات العروض الخاصة. \n 3.	لا يحق  المطالبه باعادة الرصيد  المودع من قبل المستخدم  الا عن طريق استخدامه داخل التطبيق وشراء الخدمات. \n 4.	لا نقدم احد الخدمات المطلوبة أو دعمها إلا لصاحب الطلب وبياناته المسجلة لدينا فقط لاغير. \n 5.	في حال مخالفة الشروط قد يفرض - تطبيق الحوت - غرامة لإعادة الخدمة يقوم بتقديرها ويحق له تحديد السعر دون وضعه في الشروط. \n 6.	يحق لـ - تطبيق الحوت - تغيير أي بند من الشروط الموجودة في هذه الصفحة في الوقت الذي يراه مناسب وان لم يصله تنبيه. \n 7.	لا يحق للمستخدم المطالبه بالغاء او تعديل اي خدمه قد تمت من طرفه من خلال التطبيق بعد اتمام العمليه او إدراجها تحت قائمة جاري الشحن  مع العلم بان الموظفين  العاملين على التطبيق سيبذلون جهدهم في  المحاوله لتعديل اي خطاء. \n 8.	التطبيق غير مسؤول عن اي خطاء في ادخال الارقام او المبالغ المراد شرائها من قبل العميل  لذلك حاول قدر المستطاع التاكد من ادخال الخدمه الصحيح والارقام الصحيحه قبل تاكيد اي عمليه. \n 9.	التطبيق يعمل في اوقات محدده  سوف يتم الاعلان عنها للجميع  ولا يمكن تجاوزها. ."),
                            );
                          }),
                    ),
                  ),
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
                    RegistrationData data = RegistrationData(
                      id: 0, // Example ID
                      creationDate: DateFormat('yyyy-MM-dd', 'en')
                          .format(DateTime.now())
                          .toString(),
                      createdBy: "Admin", // Example createdBy
                      modificationDate:
                          null, // Example modificationDate (assuming null for now)
                      modifiedBy:
                          null, // Example modifiedBy (assuming null for now)
                      userName: codeRName.text, // Example userName
                      firstName: codeRFirstName.text,
                      lastName: codeRLastName.text,
                      gender: selectedGender,
                      mobileNo: codePNumber.text,
                      email: codeREmail.text,
                      birthDate: DateFormat('yyyy-MM-dd', 'en')
                          .format(selectedDate!)
                          .toString(),
                      password: codeRPassword.text,
                      address: "Amman", // Example address
                      status: 1, // Example status
                      userType: 1, // Example userType
                      imageName: "User.PNG", // Example imageName
                      image: null, // Example image (assuming null for now)
                      points: 0, // Example points
                    );
                    await Provider.of<GetData>(context, listen: false)
                        .fetchAddPlayers(data.toJson());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignInScreen()));
                    codeREmail.text = "";
                    codeRName.text = "";
                    codeRPassword.text = "";
                    codeRPConfirmPassword.text = "";
                    codePNumber.text = "";
                    codeRFirstName.text = "";
                    codeRLastName.text = "";
                    selectedGender = 0;
                  },
                  child: Text(
                    "اوافق على الشروط",
                    style: TextStyle(
                        fontFamily: 'Medium',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            showCloseIcon: true,
            dialogType: DialogType.noHeader)
        .show();
  }

  AwsomeDialogDesignError() {
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
                  child: Text("Please select Gender"),
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
