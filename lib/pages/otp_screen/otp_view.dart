import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
import 'package:flluter2cpi/pages/otp_screen/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flluter2cpi/pages/Login_page/login.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<Otp_view>(context, listen: false);
    final state2 = Provider.of<View_model>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: 844.h,
          width: 390.w, //the heigh of the frame
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
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30, right: 16, left: 16, top: 16),
                    child: FrostedGlassBox(
                      width: 471.0.w,
                      height: 510.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              'Code verification',
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
                            "Please enter the code sent to :user@esi-sba.dz ",
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
                                height: 118.h,
                                width: 350.w,
                                child: Container(
                                    padding: const EdgeInsets.all(28),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Consumer<View_model>(
                                      builder: (context, value, child) =>
                                          Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              _otp_textfield(
                                                  first: true,
                                                  last: false,
                                                  digit: state.code1),
                                              _otp_textfield(
                                                  first: false,
                                                  last: false,
                                                  digit: state.code2),
                                              _otp_textfield(
                                                  first: false,
                                                  last: false,
                                                  digit: state.code3),
                                              _otp_textfield(
                                                  first: false,
                                                  last: true,
                                                  digit: state.code4),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(80.w, 16.h),
                                backgroundColor:
                                    const Color.fromRGBO(32, 197, 122, 1),
                                padding: (const EdgeInsets.only(
                                    bottom: 15, left: 30, right: 30, top: 15)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.r)),
                              ),
                              onPressed: () async {
                                await state.verifyDigits(
                                    state.code1.text +
                                        state.code2.text +
                                        state.code3.text +
                                        state.code4.text,
                                    state2.email_controler1.text);
                                if (state.message_success != null) {
                                  // success
                                  Navigator.pushNamed(context,"newPassword");
                                } else {
                                  debugPrint("failed");
                                }
                              },
                              child: Text(
                                textAlign: TextAlign.center,
                                "Submit code",
                                style: GoogleFonts.poppins(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                          SizedBox(
                            height: 7.h,
                          ),
                          InkWell(
                            child: Text(
                              "Resend code",
                              style: GoogleFonts.poppins(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(32, 197, 122, 1)),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }

  Widget _otp_textfield(
      {required bool first, last, required TextEditingController digit}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Color.fromRGBO(217, 217, 217, 1)),
      height: 36.h,
      child: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: TextField(
            controller: digit,
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: true,
            readOnly: false,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 14),
                counter: Offstage(),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
