import 'package:flluter2cpi/pages/OnBoarding_Screen/pages/page1.dart';
import 'package:flluter2cpi/pages/OnBoarding_Screen/pages/page2.dart';
import 'package:flluter2cpi/pages/OnBoarding_Screen/pages/page3.dart';
import 'package:flluter2cpi/pages/OnBoarding_Screen/pages/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(3, 117, 89, 0.85),
              //      Color.fromRGBO(1, 61, 46, 0.8), //1
              Color.fromRGBO(0, 75, 57, 0.88),
              Color.fromRGBO(41, 45, 54, 0.97), //2
              Color.fromRGBO(39, 42, 48, 0.98),
              Color.fromRGBO(24, 26, 32, 0.97),
              Color.fromRGBO(0, 0, 0, 0.98),
            ],
            stops: [0.08, 0.16, 0.33, 0.38, 0.5, 0.6],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
              print(index);
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 150.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color.fromRGBO(0,0,0,0.98), width: 2)),
          color: Color.fromRGBO(0, 0, 0, 0.98),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: controller, // PageController
              count: 4,
              effect: ExpandingDotsEffect(
                radius: 10.0.r,
                expansionFactor: 2,
                dotColor: const Color.fromRGBO(217, 217, 217, 1),
                activeDotColor: const Color.fromRGBO(32, 192, 122, 1),
                dotWidth: 30.0.w,
                dotHeight: 10.0.h,
                spacing: 8.0.w,
              ), // your preferred effect
              onDotClicked: (value) {
                setState(() {
                  controller.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                });
              },
            ),
            SizedBox(height: 25.0.h),
            InkWell(
              onTap: () async{
             if(index != 3){  setState(() {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                  );
                });} else {
                  final pref =await SharedPreferences.getInstance();
                  pref.setBool("showChoicePage", true);
                  Navigator.of(context).pushReplacementNamed("choice");
                }
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 95.0.w),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 197, 122, 1),
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Text(
                  index == 3 ? "Start" : "Next",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index == 3
                      ? controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn,
                        )
                      : controller.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.fastOutSlowIn,
                        );
                });
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 95.0.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0.r),
                ),
                child: Text(
                  index == 3 ? "Back" : "Skip",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(119, 119, 119, 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0.h),
          ],
        ),
      ),
    );
  }
}
