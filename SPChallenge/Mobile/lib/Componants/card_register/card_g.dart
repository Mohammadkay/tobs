import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Share/global.dart';
import 'package:spchallange/Themes/theme.dart'; // Import for date formatting

class CardGScreen extends StatefulWidget {
  final Function goNext;
  CardGScreen(this.goNext);

  @override
  _CardGScreenState createState() => _CardGScreenState();
}

class _CardGScreenState extends State<CardGScreen> {
  static final _formKey = GlobalKey<FormState>();

  submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Validate and process form data
      if (selectedDate != null) {
        widget.goNext();
      } else {
        AwsomeDialogDesign();
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      locale: Locale('ar', 'AE'), // Example for Arabic locale
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
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
              mainColor,
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
              // Date Picker Widget
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Date of Birth",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                          : "اختر التاريخ",
                      style: TextStyle(
                        fontSize: 20,
                        color: mainColor, // Replace with your mainColor
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                      color: mainColor, // Replace with your mainColor
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
            borderSide: BorderSide(color: Colors.white, width: 2),
            buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
            headerAnimationLoop: false,
            animType: AnimType.scale,
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text("Please fill Your Date Of Birth"),
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
