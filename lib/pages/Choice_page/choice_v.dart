import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../Login_page/components/guest.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;
//
//
//
//
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
            stops: [0.08, 0.16, 0.33, 0.38, 0.5, 0.78],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 43.h),
              SizedBox(
                height: 90.h,
                width: 85.w,
                child: Image.asset(
                  "lib/images/g1.png",
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              SizedBox(height: 23.h),
              SizedBox(
                height: 39.h,
                width: 170.w,
                child: Image.asset(
                  "lib/images/logo.png",
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              SizedBox(height: 79.h),
              Text(
                "Get started",
                style: GoogleFonts.poppins(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                //height: ,
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(4, 38, 30, 0.06),
                        Color.fromRGBO(5, 5, 5, 0.76)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.1),
                      Color.fromRGBO(123, 119, 119, 0.05),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 29.h),
                    Text(
                      "Welcome to Guide",
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 52.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed("LogIn"),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 52.w),
                              child: Text(
                                "Log in",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.of(context).pushNamed("SignUp"),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 52.w),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(32, 197, 122, 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: Offset(-1, 0),
                                    )
                                  ]),
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 54.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: const Color.fromRGBO(100, 98, 98, 1),
                          thickness: 1,
                          indent: 54.w,
                          endIndent: 25.w,
                        )),
                        Text(
                          "Or",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: const Color.fromRGBO(100, 98, 98, 1),
                          thickness: 1,
                          indent: 25.w,
                          endIndent: 54.w,
                        )),
                      ],
                    ),
                    SizedBox(height: 29.h),
                    InkWell(
                      onTap: () {
                        showDialogg(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(38, 38, 38, 0.05),
                              Color.fromRGBO(75, 75, 75, 0.48),
                            ],
                          ),
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(20, 244, 123, 0.41),
                                Color.fromRGBO(20, 244, 123, 0.09),
                              ],
                            ),
                          ),
                        ),
                        child: Text(
                          "Enter as guest",
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 77.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
