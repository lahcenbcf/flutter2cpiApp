import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core_post_controller.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.hint,
    required this.controllerTag,
  });

  final String hint;
  final String controllerTag;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    //
    //
    //
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final CorePostCotroller state = Get.find(tag: widget.controllerTag);
    //
    //
   
    @override
    void dispose() {
      
      super.dispose();
      state.controller.dispose();
    }
    //
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(35, 47, 56, 1),
        border: Border(top: BorderSide(color: Colors.white, width: 0.5)),
      ),
      child: TextFormField(
        controller: state.controller,
        focusNode: state.unitCodeCtrlFocusNode,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        cursorWidth: 0.5,
        textInputAction: TextInputAction.done,
        maxLines: null,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(139, 152, 165, 1),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
          fillColor: const Color.fromRGBO(46, 60, 75, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20).r,
            borderSide: const BorderSide(color: Colors.black, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20).r,
            borderSide: const BorderSide(color: Colors.black, width: 0.5),
          ),
          suffixIcon: InkWell(
            onTap: () {
              state.sendComment(context);
              //state.addComment("lahcen",state.controllerTag,state.type,state.controller.text);
              Get.forceAppUpdate();
            },
            child: Icon(
              FluentIcons.send_28_filled,
              size: 23 * iconSize,
              color: const Color.fromRGBO(32, 197, 122, 1),
            ),
          ),
        ),
      ),
    );
  }
}
