import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../new_password_vm.dart';

class CustomTextField2 extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField2(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = 25 * (((size.height / 844) + (size.width / 390)) / 2);
    return Consumer<NewPasswordViewModel>(
      builder: (context, state, child) => TextFormField(
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      

        validator: hint == "Confirm password"
            ? (value) => state.confirmPasswordValidator(value)
            : null,

        // for the text typed by the user
        style: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
        //
        obscureText: hint == "New password"
            ? !state.eyeOpenedPassword
            : !state.eyeOpenedConfirmPassword,
        // cursor
        cursorColor: const Color.fromRGBO(0, 0, 0, 1),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h),
          fillColor: const Color.fromRGBO(239, 238, 238, 1),
          filled: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 13.w),
            child: InkWell(
              radius: iconSize / 2,
              onTap: () => hint == "New password"
                  ? state.swithPassworState()
                  : state.swithConfirmPassworState(),
              child: (hint == "New password")
                  ? state.eyeOpenedPassword
                      ? Icon(FluentIcons.eye_off_24_filled, size: iconSize)
                      : Icon(FluentIcons.eye_24_filled, size: iconSize)
                  : state.eyeOpenedConfirmPassword
                      ? Icon(FluentIcons.eye_off_24_filled, size: iconSize)
                      : Icon(FluentIcons.eye_24_filled, size: iconSize),
            ),
          ),
          suffixIconColor: const Color.fromRGBO(33, 33, 33, 1),

          ///for the hint
          hintMaxLines: 1,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(0, 0, 0, 0.61),
          ),
          //for the outlined border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          errorStyle: GoogleFonts.poppins(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
