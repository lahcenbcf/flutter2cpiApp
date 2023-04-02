import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flluter2cpi/pages/Login_page/login.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<View_model>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width, //the heigh of the frame
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 85.w,
                    child: Image.asset('lib/images/logo.png'),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 39.h,
                    width: 170.w,
                    child: Image.asset(
                      'lib/images/g1.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30, right: 16, left: 16, top: 16),
                    child: Form(
                      child: FrostedGlassBox(
                        width: 471.0.w,
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                'Forgot password ?',
                                style: GoogleFonts.poppins(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              "Don't worry it ! happens. please enter the adress associated with your account.",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 29.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 1, left: 1, bottom: 35),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(62, 67, 79, 1),
                                    borderRadius: BorderRadius.circular(25)),
                                height: 208.h,
                                width: 343.w,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 9,
                                          left: 9,
                                          top: 24,
                                          bottom: 25),
                                      child: Consumer<View_model>(
                                        builder: (context, val, child) =>
                                            TextFormField(
                                          controller: val.email_controler1,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (String? value) =>
                                              val.validate(value),
                                          enabled: true,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.email_rounded,
                                              color: Colors.black,
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20.14,
                                                    right: 10.57,
                                                    top: 15),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            hintText: 'Email',
                                            hintStyle: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 0.61)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(200.w, 45.h),
                                        backgroundColor: const Color.fromRGBO(
                                            32, 197, 122, 1),
                                        padding: (const EdgeInsets.only(
                                            bottom: 12,
                                            left: 80,
                                            right: 80,
                                            top: 7)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(13.r)),
                                      ),
                                      onPressed: () async {
                                        Navigator.pushNamed(context, "otpView");
                                        // //call apiService
                                        // debugPrint("hello");
                                        // await state.sendEmailToVerify(
                                        //     state.email_controler1.text);
                                        // if (state.CanPass) {
                                        //   // ignore: use_build_context_synchronously
                                        //   Navigator.pushNamed(
                                        //       context, "otpView");
                                        // } else {
                                        //   // ignore: use_build_context_synchronously
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       dismissDirection:
                                        //           DismissDirection.horizontal,
                                        //       content: Text(
                                        //         state.messageToShown!,
                                        //         style: GoogleFonts.poppins(
                                        //           fontSize: 15.sp,
                                        //           fontWeight: FontWeight.w300,
                                        //           color: Colors.white,
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   );
                                        // }
                                      },
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.poppins(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
