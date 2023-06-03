import 'package:flluter2cpi/pages/New_password/new_password_vm.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/CustomTextField2.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
//
//
    final size = MediaQuery.of(context).size;
    final state = Provider.of<NewPasswordViewModel>(context, listen: false);
    final state2 = Provider.of<View_model>(context, listen: false);
//
//
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width, //the heigh of the frame
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(3, 117, 89, 0.85),
              Color.fromRGBO(1, 61, 46, 0.8),
              // Color.fromRGBO(1,61,46,0.88),
              // // Color.fromRGBO(41,45,54,0.97),
              // // Color.fromRGBO(39,42,48,0.98),
              Color.fromRGBO(24, 26, 32, 0.97),
              Color.fromRGBO(0, 0, 0, 0.96),
              Color.fromRGBO(0, 0, 0, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 43.h,
                ),
                SizedBox(
                  height: 90.h,
                  width: 85.w,
                  child: Image.asset(
                    "lib/images/g1.png",
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 39.h,
                  width: 170.w,
                  child: Image.asset(
                    "lib/images/logo.png",
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(height: 42.h),
                Container(
                  width: 371.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(41, 45, 54, 0.47),
                        Color.fromRGBO(41, 45, 54, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 33.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Set new password",
                          style: GoogleFonts.poppins(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter your new password bellow",
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: 343.w,
                        padding: EdgeInsets.symmetric(horizontal: 9.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: const Color.fromRGBO(62, 67, 79, 1),
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 37.h),
                              CustomTextField2(
                                  hint: "New password",
                                  controller: state.newPasswordController),
                              SizedBox(height: 35.h),
                              CustomTextField2(
                                  hint: "Confirm password",
                                  controller: state.confirmPasswordController),
                              SizedBox(height: 37.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 39.h),
                      ElevatedButton(
                        onPressed: () async{
                          /*if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }*/
                          if (formKey.currentState != null) {
                            if (formKey.currentState!.validate()) {
                              await state.setNewPassword(state.newPasswordController.text,state2.email_controler1.text);
                             state.cleanInputs(state2.email_controler1.text);
                             // await state.setNewPassword(state.newPasswordController.text,state2.email_controler1.text);
                              if(state.success){
                                // ignore: use_build_context_synchronously
                                
                                // ignore: use_build_context_synchronously
                                showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(41, 45, 54, 1),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40.r),
                                          topRight: Radius.circular(40.r)),
                                    ),
                                    child: Wrap(
                                     crossAxisAlignment: WrapCrossAlignment.center,
                                     runAlignment: WrapAlignment.center,
                                     direction: Axis.vertical,
                                      children: [
                                        SizedBox(height: 37.h),
                                        SizedBox(
                                          height: 90.w,
                                          width: 90.w,
                                          child: Image.asset(
                                            "lib/images/checked.png",
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.contain,
                                        ),
                                        ),
                                        SizedBox(height: 22.h),
                                        Text(
                                          "Password Updated",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 30.h),
                                        ElevatedButton(
                                          onPressed: () => Navigator.of(context)
                                              .pushNamed("LogIn"),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    32, 197, 122, 1),
                                            foregroundColor:
                                                const Color.fromRGBO(
                                                    255, 255, 255, 0.91),
                                            textStyle: GoogleFonts.poppins(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                                horizontal: 54.w),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                          ),
                                          child: const Text(
                                            "Return to login",
                                          ),
                                        ),
                                        SizedBox(height: 37.h),

                                      ],
                                    ),
                                  );
                                },
                              );
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    dismissDirection:
                                        DismissDirection.horizontal,
                                    content: Text(
                                      state.message!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              
                              
                                // ignore: use_build_context_synchronously
                                
                              }
                              
                            }
                             
                             
                          }
                        ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(32, 197, 122, 1),
                          foregroundColor:
                              const Color.fromRGBO(255, 255, 255, 0.91),
                          textStyle: GoogleFonts.poppins(
                              fontSize: 20.sp, fontWeight: FontWeight.w700),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 39.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: const Text(
                          "Submit password",
                        ),
                      ),
                      SizedBox(height: 33.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}