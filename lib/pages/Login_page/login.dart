import 'dart:js';
import 'dart:ui';
import 'package:flluter2cpi/pages/Login_page/components/guest.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';
import 'view_model.dart';

class Login extends StatelessWidget {
GlobalKey<FormState> forme=GlobalKey<FormState>();
send(){
  //var formdata=forme.currentState;
 // if (formdata.validate()){print("valid");}else{print("invalid");}
}

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
            height: 844.h,
            width: 390.w,//the heigh of the frame
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(3, 117, 89, 0.85),
                Color.fromRGBO(0, 90, 60, 0.88),
                Color.fromRGBO(0, 75, 57, 0.97),
                Color.fromRGBO(0, 75, 57, 0.98),
                Color.fromRGBO(24, 26, 32, 0.97),
                Color.fromRGBO(0, 0, 0, 0.98),
              ],
              stops: [0.05, 0.16, 0.35, 0.38, 0.6, 0.78],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 85.w,
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 39.h,
                    width: 170.w,
                    child: Image.asset(
                      'images/guide_text.png',
                    ),
                  ),
                  SizedBox(height: 70.h, width: 20.w),
                  ListTile(
                    title: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          fontSize: 32.sp, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 57, right: 16, left: 16, top: 16),
                    child: Form(
                      child: FrostedGlassBox(
                        width: 358.0.w,
                        height: 660.h,
                        child: Container(key: forme,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [



                              Consumer<View>(builder:(context, val, child) => Column(
                                children: [
                                  TextFormField(controller: val.email_controler,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator:(String? value)=>val.validate(value),



                                    enabled: true,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      suffixIcon:const Icon(
                                        Icons.email_rounded,
                                        color: Colors.black,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      const EdgeInsets.only(left: 20.14, right: 120.57, top: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                      ) ,focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14.sp, fontWeight: FontWeight.w500,color: Color.fromRGBO(0, 0, 0, 0.61)),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  TextFormField(
                                    enabled: true,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    obscureText:val.eyeoff,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                        onTap: ()=>val.switchState(),
                                        child: const Icon(
                                          FluentIcons.eye_12_filled,
                                          color: Colors.black,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,

                                      contentPadding:
                                      const EdgeInsets.only(left: 20.14, right: 12.57, top: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                      ) ,focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.poppins(
                                          fontSize: 14.sp, fontWeight: FontWeight.w500,color:const Color.fromRGBO(0, 0, 0, 0.61)),
                                    ),
                                  ),
                                ],
                              ),),

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 140.0, top: 5.0, right: 7, bottom: 16),
                                child: SizedBox(
                                    width: 110.w,
                                    child: InkWell(
                                      onTap: () {
                                        print("taped");
                                      },
                                      child: Text(
                                        'Forget passWord?',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: const Color.fromRGBO(0, 200, 152, 1),
                                      padding:
                                          (EdgeInsets.symmetric(vertical: 10.h, horizontal: 72.5.w)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(17.r))),
                                  onPressed: send,
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                        fontSize: 29.sp, fontWeight: FontWeight.w700),
                                  )),
                              SizedBox(height: 31.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't you have an account yet ?",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Register",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 47.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Color.fromRGBO(100, 98, 98, 1),
                                      thickness: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.5.w,
                                  ),
                                  Text(
                                    "OR",
                                    style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 16.5.w,
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Color.fromRGBO(100, 98, 98, 1),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                    side: const BorderSide(
                                      color: Color.fromRGBO(0, 200, 152, 1),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 66.w), //shape:MaterialStateProperty.all(BorderSide(color: )),

                                  backgroundColor: Colors.grey.shade900,
                                ),
                                onPressed: () {
                                  showDialogg(context);
                                },
                                child: Text(
                                  "Enter as guest",
                                  style: GoogleFonts.inter(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(205, 205, 205, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}

/*child:SafeArea( child: Column(mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox(height:170.0 ,width:35 ,child: Image.asset('images/Gu1de_darkversion.png',alignment: Alignment.topCenter,),),
fit:fill
],
),)*/
class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlassBox({required this.width, required this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: Container(width: width, height: height, child: Text(" ")),
            ),
            Container(
              padding: EdgeInsets.only(top: 35, bottom: 22, left: 16, right: 16),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.20), blurRadius: 30, offset: Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(20.0.r),
                  border: Border.all(color: Color.fromRGBO(4, 38, 30, 0.06), width: 1.0.w),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(4, 38, 30, 0.06),
                      Color.fromRGBO(5, 5, 5, 0.76),
                    ], /* stops: [
                   0.0,
                  ]*/
                  )),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
