import 'package:flluter2cpi/pages/School_year/Components/year_selecter.dart';
import 'package:flluter2cpi/pages/School_year/school_year_view_model.dart';
//import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import '../Sign_up/User_Modal.dart';
import '../Sign_up/sign_up_view_model.dart';

class SchoolYear extends StatelessWidget {
  const SchoolYear({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SchoolYearViewModel>(context, listen: false);
  final Registerstate = Provider.of<SignUpViewModel>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(3, 117, 89, 0.85),
              //      Color.fromRGBO(1, 61, 46, 0.8), //1
              Color.fromRGBO(0, 75, 57, 0.88),
              Color.fromRGBO(41, 45, 54, 0.97), //2
              Color.fromRGBO(39, 42, 48, 0.98),
              Color.fromRGBO(24, 26, 32, 0.97),
              Color.fromRGBO(0, 0, 0, 0.98),
            ],
            stops: [0.08, 0.16, 0.33, 0.38, 0.5, 0.78],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
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
                SizedBox(height: 10.h),
                SizedBox(
                  height: 39.h,
                  width: 170.w,
                  child: Image.asset(
                    "lib/images/logo.png",
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(height: 59.h),
                Container(
                  //  height: 500.h,
                  width: 371.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(4, 38, 30, 0.06),
                          Color.fromRGBO(5, 5, 5, 0.76)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.1),
                        Color.fromRGBO(123, 119, 119, 0.05),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        Text(
                          "Welcome to Guide",
                          style: GoogleFonts.poppins(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(height: 26.h),
                        Text(
                          "Before we continue. Please enter your school year.",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(height: 37.h),
                        Container(
                          height: 231.h,
                          width: 343.w,
                          padding: EdgeInsets.symmetric(horizontal: 9.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: const Color.fromRGBO(62, 67, 79, 1),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 50.h),
                                //DropDownButton
                                const YearSelecter(),
                                SizedBox(height: 9.h),

                                //
                                //
                                //check if the user have selected a school year
                              

                                ElevatedButton(
                                  onPressed: () async{
                                    // state.setYear = null;
                                    if(state.selectedYear !=null){
                                     
                                      await state.pressButton(UserModal(
                                        fullName: Registerstate
                                            .fullNameController.text,
                                        email:
                                            Registerstate.emailController.text,
                                        password: Registerstate
                                            .passwordController.text,
              
                                        schoolYear: state.selectedYear));
                                          
                                        Navigator.of(context).pushNamed("LogIn"); 
                                       if(state.successRegister){
                                             
                                      }else{
                                        ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      content: Text(
                                        state.isDuplicate,
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
                                        "enter your school year please",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                    }
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(32, 197, 122, 1),
                                    foregroundColor: const Color.fromRGBO(
                                        255, 255, 255, 0.91),
                                    textStyle: GoogleFonts.poppins(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 82.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                  child: const Text("Continue"),
                                ),
                                SizedBox(height: 30.h)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 85.h,
                        ),
                      ],
                    ),
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
