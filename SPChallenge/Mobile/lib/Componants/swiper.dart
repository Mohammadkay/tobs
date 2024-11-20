// import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:sizer/sizer.dart';
import 'package:spchallange/Componants/swiper_control.dart';

// import '../test/test.dart';

class CustomSwiper extends StatefulWidget {
  const CustomSwiper({super.key});

  @override
  _CustomSwiperState createState() => _CustomSwiperState();
}

List<String> image = [
  "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt4b22345d697982c1/64e995dcb2ec2a4e9f11b74a/Cristiano_Ronaldo_Al-Nassr_2023-24_(2).jpg?auto=webp&format=pjpg&width=3840&quality=60",
  "https://pbs.twimg.com/media/F3G4ZnQXgAErxNp.jpg:large"
];

class _CustomSwiperState extends State<CustomSwiper> {
  SwiperController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = new SwiperController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> image = Provider.of<GetData>(context).images;
    final decorator = DotsDecorator(
      activeColor: Colors.white,
      size: Size.square(8.0.sp),
      activeSize: Size.square(8.0.sp),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0.sp),
      ),
    );
    return SizedBox(
      height: 30.h,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
            width: double.infinity,
            child: Swiper(
              controller: _controller,
              itemBuilder: (context, index) {
                return Image.network(
                  image[index],
                  fit: BoxFit.fill,
                  scale: 1.0,
                );
              },
              autoplay: true,
              itemCount: image.length,
              // pagination: const SwiperPagination(
              //   builder: SwiperPagination.rect,
              // ),
              control: const CustomSwiperControl(padding: EdgeInsets.only()),
              onIndexChanged: (value) {
                setState(() {
                  _controller!.index = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 5.h,
            width: double.infinity,
            child: DotsIndicator(
              dotsCount: image.length,
              position: _controller!.index,
              axis: Axis.horizontal,
              decorator: decorator,
            ),
          ),
        ],
      ),
    );
  }
}
