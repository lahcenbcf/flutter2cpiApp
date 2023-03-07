import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = 25 * (((size.height / 844) + (size.width / 390)) / 2);
    return Consumer<SignUpViewModel>(
      builder: (context, state, child) => TextFormField(
        controller: controller,
       autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: false,
        
        keyboardType: hint == "First name" || hint == "Last name"
            ? TextInputType.name
            : TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        textCapitalization: hint == "Full name"
            ? TextCapitalization.words
            : TextCapitalization.none,
        validator: (value) {
          switch (hint) {
            case "Full name":
              return state.nameValidator(value);

            case "Email":
              return state.emailValidator(value);
            case "Confirm password":
              return state.confirmPasswordValidator(value);
            default:
              null;
          }
          return null;
        },

        // for the text typed by the user
        style: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
        //
        obscureText: (hint != "Password" && hint != "Confirm password")
            ? false
            : hint == "Password"
                ? !state.isEyeOffPassword
                : !state.isEyeOffConfirmPassword,
        // cursor
        cursorColor: const Color.fromRGBO(0, 0, 0, 1),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h),
          fillColor: const Color.fromRGBO(239, 238, 238, 1),
          filled: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 13.w),
            child: (hint != "Password" &&
                    hint != "Confirm password" &&
                    hint != "Full name")
                ? Icon(FluentIcons.mail_24_filled, size: iconSize)
                : hint == "Full name"
                    ? Icon(FluentIcons.person_24_filled,size: iconSize,)
                    : InkWell(
                        radius: iconSize / 2,
                        onTap: () => hint == "Password"
                            ? state.swithPassworState()
                            : state.swithConfirmPassworState(),
                        child: (hint == "Password")
                            ? state.isEyeOffPassword
                                ? Icon(FluentIcons.eye_off_24_filled,
                                    size: iconSize)
                                : Icon(FluentIcons.eye_24_filled,
                                    size: iconSize)
                            : state.isEyeOffConfirmPassword
                                ? Icon(FluentIcons.eye_off_24_filled,
                                    size: iconSize)
                                : Icon(FluentIcons.eye_24_filled,
                                    size: iconSize)),
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
