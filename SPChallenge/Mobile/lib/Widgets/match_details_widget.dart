import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Themes/theme.dart';

class MatcheDetailsWidget extends StatefulWidget {
  const MatcheDetailsWidget({super.key});

  @override
  State<MatcheDetailsWidget> createState() => _MatcheDetailsWidgetState();
}

class _MatcheDetailsWidgetState extends State<MatcheDetailsWidget> {
  final List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
            width: double.infinity,
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: SizedBox(
                  height: 10.h,
                  width: 20.w,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0.sp),
                    ),
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0.sp),
                      child: Image.asset(
                        'Assets/Images/card.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
                width: 60.w,
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Today ,8:00 PM - 9:00 pm",
                          style: TextStyle(color: Colors.white)),
                      Text("MAHMOUD", style: TextStyle(color: Colors.white)),
                      Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(2.0.sp),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        title: Text(
                          items[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(Icons.arrow_forward,
                            color: Colors
                                .white), // Icon to the right of the ListTile
                        onTap: () {
                          // Handle tap on the ListTile
                          print('Tapped on item: ${items[index]}');
                        },
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Divider(
                          color: Colors.grey, // Specify the color of the line
                          thickness: 1.0, // Specify the thickness of the line
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            height: 7.h,
            width: MediaQuery.of(context).size.width * 0.84,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 1.5.sp)),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(mainColor),
              ),
              onPressed: () {},
              child: Text(
                'Join Match',
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
