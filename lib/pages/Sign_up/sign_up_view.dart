import 'package:flluter2cpi/pages/Sign_up/Components/custom_text_field.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';

/// colors
const primaryColor = Color(0x0020C57A); //for the sign up button
const mainColor = Color(0x00292D36);

//
final font = GoogleFonts.poppins();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;
    final state = Provider.of<SignUpViewModel>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          height: 39.h,
          width: 170.w,
          child: Image.asset(
            "lib/images/logo.png",
            fit: BoxFit.fill,
          ),
        ),
        // leading: Container(
        //   height: 48.h,
        //   width: 48.w,
        //   margin: EdgeInsets.only(left: 10.w, top: 5.h),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.r),
        //     border: Border.all(
        //       color: const Color.fromRGBO(46, 46, 46, 0.12),
        //     ),
        //   ),
        //   child: FittedBox(
        //     fit: BoxFit.fill,
        //     alignment: Alignment.center,
        //     child: InkWell(
        //       onTap: () {},
        //       child: const Icon(
        //         FluentIcons.arrow_left_48_filled,
        //         color: Color.fromRGBO(33, 33, 33, 1),
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
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
        child: SingleChildScrollView(
          child: InkWell(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 39.h,
                //   width: 170.w,
                //   child: Image.asset(
                //     "lib/images/logo.png",
                //   ),
                // ),
                SizedBox(height: 90.h),
                Text(
                  "Create new account",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 18.h),
                    //height: ,

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
                    child: Form(
                      key: formState,
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: "Full name",
                            controller: state.fullNameController,
                          ),
                          SizedBox(height: 25.h),
                          // CustomTextField(
                          //   hint: "Last name",
                          //   controller: state.lasttNameController,
                          // ),
                          // SizedBox(height: 25.h),
                          CustomTextField(
                            hint: "Email",
                            controller: state.emailController,
                          ),
                          SizedBox(height: 25.h),
                          CustomTextField(
                            hint: "Password",
                            controller: state.passwordController,
                          ),
                          SizedBox(height: 25.h),
                          CustomTextField(
                            hint: "Confirm password",
                            controller: state.confirmPasswordController,
                          ),
                          SizedBox(height: 40.h),
                          ElevatedButton(
                            onPressed: () {
                              if (formState.currentState != null) {
                                if (formState.currentState!.validate()) {
                                  Navigator.of(context).pushNamed("SchoolYear");
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "please make sure there is no error."),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(32, 197, 122, 1),
                              textStyle: GoogleFonts.poppins(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 62.5.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: const Text("Register now"),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Already have an account? ",
                                maxLines: 1,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("HomePage");
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Color.fromRGBO(100, 98, 98, 1),
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: 16.5.w,
                              ),
                              Text(
                                "Or continue with",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 16.5.w,
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Color.fromRGBO(100, 98, 98, 1),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7.h),
                          InkWell(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 30.r,
                              backgroundColor:
                                  const Color.fromRGBO(217, 217, 217, 1),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Image.asset(
                                  "lib/images/google.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
