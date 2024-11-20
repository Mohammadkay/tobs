import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Screens/privacy_policy.dart';
import 'package:spchallange/Screens/terms_conditions.dart';
import 'package:spchallange/Services/environment.dart';
import 'package:spchallange/Themes/theme.dart';
import 'package:spchallange/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  List<dynamic> iconsList = [
    Icon(
      Bootstrap.phone,
      color: Colors.white,
    ),
    Icon(
      Bootstrap.whatsapp,
      color: Colors.white,
    ),
    Icon(
      Bootstrap.instagram,
      color: Colors.white,
    ),
    Icon(
      Bootstrap.tiktok,
      color: Colors.white,
    ),
  ];
  List<String> titleList = [
    "Call",
    "Whatsapp",
    "Instegram",
    "TikTok",
  ];
  List<String> urlList = [
    "0096780991462",
    "https://youtube.com/channel/UCUEvWlnqWcoB6EPrY0VGQSw",
    "https://youtube.com/channel/UCUEvWlnqWcoB6EPrY0VGQSw",
    "https://youtube.com/channel/UCUEvWlnqWcoB6EPrY0VGQSw",
  ];
  bool checkLanguage = true;

  @override
  Widget build(BuildContext context) {
    Stream stream = localeController.stream;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      stream.listen((value) {
        setState(() {
          S.load(value);
        });
      });
    });
    return Directionality(
      textDirection: currentTextDir,
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "App Settings",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Language ${S().language}",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Directionality(
                                  textDirection: currentTextDir,
                                  child: StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Container(
                                        height: 35.h,
                                        width: 100.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(6.sp),
                                              child: Text(
                                                "Language",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: mainColor),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.sp),
                                              child: Text(
                                                'select your prefered language',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: mainColor),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.sp),
                                              child: ListTile(
                                                onTap: () {
                                                  setState(() {
                                                    currentLanguage == "ARABIC"
                                                        ? currentLanguage =
                                                            "ENGLISH"
                                                        : currentLanguage =
                                                            "ARABIC";
                                                    currentLanguage == "ENGLISH"
                                                        ? S.load(
                                                            Locale("ar", ""))
                                                        : S.load(
                                                            Locale("en", ""));

                                                    currentLocale =
                                                        currentLanguage ==
                                                                "ENGLISH"
                                                            ? en
                                                            : ar;
                                                    currentTextDir =
                                                        currentLanguage ==
                                                                "ENGLISH"
                                                            ? TextDirection.ltr
                                                            : TextDirection.rtl;
                                                    localeController
                                                        .add(currentLocale);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                leading:
                                                    currentLanguage == "ENGLISH"
                                                        ? Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            size: 20.sp,
                                                            color: Colors.blue,
                                                          )
                                                        : SizedBox(),
                                                title: Text(
                                                  'English',
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: mainColor),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.sp),
                                              child: Divider(
                                                color: mainColor,
                                                height: 1.h,
                                                thickness: 1.sp,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(4.sp),
                                              child: ListTile(
                                                onTap: () {
                                                  setState(() {
                                                    currentLanguage == "ENGLISH"
                                                        ? currentLanguage =
                                                            "ARABIC"
                                                        : currentLanguage =
                                                            "ENGLISH";
                                                    currentLanguage == "ENGLISH"
                                                        ? S.load(
                                                            Locale("ar", ""))
                                                        : S.load(
                                                            Locale("en", ""));

                                                    currentLocale =
                                                        currentLanguage ==
                                                                "ENGLISH"
                                                            ? en
                                                            : ar;
                                                    currentTextDir =
                                                        currentLanguage ==
                                                                "ENGLISH"
                                                            ? TextDirection.ltr
                                                            : TextDirection.rtl;
                                                    localeController
                                                        .add(currentLocale);
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                leading:
                                                    currentLanguage != "ENGLISH"
                                                        ? Icon(
                                                            Icons
                                                                .check_circle_rounded,
                                                            size: 20.sp,
                                                            color: Colors.blue,
                                                          )
                                                        : SizedBox(),
                                                title: Text(
                                                  'Arabic',
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: mainColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          })
                    ],
                  ),
                ),
                Text(
                  "Legal",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30.h,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.privacy_tip, color: Colors.white),
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyScreen()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.list_alt, color: Colors.white),
                        title: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TermsConditionsScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Center(
                  child: Text(
                    "Follow US",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
                SizedBox(height: 3.h),
                Center(
                  child: SizedBox(
                    height: 15.h,
                    width: 80.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: iconsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              launchURL("tel://${urlList[index]}");
                            } else {
                              launchURL(urlList[index]);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.0.sp),
                            child: Column(
                              children: [
                                iconsList[index],
                                Text(
                                  titleList[index],
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

launchURL(String url) async {
  if (await launchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
