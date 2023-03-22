import 'package:flluter2cpi/constants/theme_Styles.dart';
import 'package:flluter2cpi/pages/Login_page/components/guest_box_view_model.dart';
import 'package:flluter2cpi/pages/Sign_up/User_Modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GuestBox extends StatefulWidget {
  const GuestBox({super.key});

  @override
  State<GuestBox> createState() => _GuestBox();
}

class _GuestBox extends State<GuestBox> {
  final GlobalKey<FormState>forme= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //
    //
    final size = MediaQuery.of(context).size;
    final state= Provider.of<GuestBoxViewModel>(context,listen: false);
    final iconSize = 25 * (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
    return Container(
      height: 240.h,
      width: 345.w,
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 40.0, bottom: 20.0),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              color: Colors.transparent,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: state.fullNameController,
                  validator: (value) => state.nameValidator(value),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,

                    cursorColor: Colors.black,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 12.w, top: 14.h, bottom: 14.h),
                    fillColor: const Color.fromRGBO(239, 238, 238, 1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),

                      hintText: "Full name",
                    suffixIcon: Icon(
                      FluentIcons.person_12_filled,
                      size: iconSize,
                      color: Colors.black,
                    ),
                    hintStyle:
                        const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.61)),
                  ),
                  ),
                ),
              ),
            
            SizedBox(height: 20.0.h),
            ElevatedButton(
              onPressed: () async{
                if(forme.currentState != null){
                  if(forme.currentState!.validate()){
                    await state.registerguest(state.fullNameController.text);
                    if(state.guestInfo !=null){
                      //rediraction 
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      content: Text(
                                        state.ErrorMessage!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                    }
                  }else{
                   
                  
                      ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      content: Text(
                                        "type a correct name",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                    
                
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(32, 197, 122, 1),

                foregroundColor: const Color.fromRGBO(255, 255, 255, 0.91),

                textStyle: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
                padding:
                    EdgeInsets.symmetric(vertical: 16.h, horizontal: 62.5.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: const Text("Get started"),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

