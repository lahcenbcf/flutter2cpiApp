import 'package:flluter2cpi/constants/theme_Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestBox extends StatelessWidget {
  const GuestBox({super.key});

  void onPressedBtn() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: 345.w,
      padding: const EdgeInsets.only(left: 15.0,right:15.0,top: 40.0,bottom: 20.0),
      decoration: BoxDecoration(
        color: ThemeInfo.primaryColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x7f000000),
            offset: Offset(0, 5),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          const Material(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: "Full name",
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        FluentIcons.person_12_filled,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          GestureDetector(
            onTap: () {
             
            },
            child: ElevatedButton(
                            onPressed: () {
                            
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(32, 197, 122, 1),
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 62.5.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: const Text("Get started"),
                          ),
          )
        ],
      ),
    );
  }
}
