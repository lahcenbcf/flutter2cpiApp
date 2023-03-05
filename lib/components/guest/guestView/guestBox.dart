import 'package:flluter2cpi/constants/theme_Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
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
                        FluentSystemIcons.ic_fluent_person_accounts_filled,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
             
            },
            child: Container(
              height: 50.h,
              width: 258.w,
              decoration:const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color:ThemeInfo.secondaryColor),
              child: Center(
                  child: Text(
                'Get started',
                style: TextStyle(
                  fontFamily: ThemeInfo.fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0),
              )),
            ),
          )
        ],
      ),
    );
  }
}
