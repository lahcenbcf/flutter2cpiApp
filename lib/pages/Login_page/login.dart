import 'dart:ui';
import 'package:flluter2cpi/pages/Login_page/components/guest.dart';
import 'package:flluter2cpi/pages/Sign_up/User_Modal.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:provider/provider.dart';
import 'view_model.dart';

class Login extends StatefulWidget {
const  Login({super.key});
 

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final state=Provider.of<View>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent),
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
                        child: Image.asset(
                          'lib/images/g1.png',
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 39.h,
                        width: 170.w,
                        child: Image.asset(
                          'lib/images/logo.png',
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      SizedBox(height: 50.h, width: 20.w),
                      ListTile(
                        title: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 57, right: 16, left: 16, top: 16),
                        child: Form(
                          key: formState,
                          child: FrostedGlassBox(
                            width: 358.0.w,
                            height: 500.h,
                            child: Container(
                              
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Consumer<View>(
                                    builder: (context, val, child) => Column(
                                      children: [
                                        TextFormField(
                                          controller: val.email_controler,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (String? value) =>
                                              val.validate(value),
                                          enabled: true,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                          ),
                                          cursorColor:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          decoration: InputDecoration(
                                            suffixIcon: const Icon(
                                              Icons.email_rounded,
                                              color: Colors.black,
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.only(
                                                left: 12.w,
                                                top: 14.h,
                                                bottom: 14.h),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            hintText: 'Email',
                                            hintStyle: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.61),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        TextFormField(
                                          enabled: true,
                                          controller: state.password_controller,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          obscureText: val.eyeoff,
                                          cursorColor:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                          style: GoogleFonts.poppins(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                          ),
                                          decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: () => val.switchState(),
                                              child: val.eyeoff
                                                  ? const Icon(
                                                      FluentIcons.eye_16_filled,
                                                      color: Colors.black,
                                                    )
                                                  : const Icon(
                                                      FluentIcons
                                                          .eye_off_16_filled,
                                                      color: Colors.black,
                                                    ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: EdgeInsets.only(
                                                left: 12.w,
                                                top: 14.h,
                                                bottom: 14.h),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            hintText: 'Password',
                                            hintStyle: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.61),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 140.0,
                                        top: 5.0,
                                        right: 7,
                                        bottom: 16),
                                    child: InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Text(
                                        'Forget passWord?',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: const Color.fromRGBO(
                                            32, 197, 122, 1),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                          horizontal: 72.5.w,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17.r),
                                        ),
                                      ),
                                      onPressed:()async {
                                        
                                        if(formState.currentState != null){
                                          if(formState.currentState!.validate()){
                                            
                                            await state.loginUser(UserModal(email: state.email_controler.text, password:state.password_controller.text));
                                            if(state.isLogged){
                                              // redirection vers home page
                                              Navigator.pushNamed(context,"HomePage");
                                            }else{
                                              // ignore: use_build_context_synchronously
                                              ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      content: Text(
                                        state.errorLoginMessage!,
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
                                          
                                        
                                        }
                                      },
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )),
                                  SizedBox(height: 31.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't you have an account yet ?",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      InkWell(
                                        child: Text(
                                          " Register",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 47.h,
                                  ),
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
                                        "OR",
                                        style: GoogleFonts.inter(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700,
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
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        side: const BorderSide(
                                          color: Color.fromRGBO(0, 200, 152, 1),
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15.h,
                                          horizontal: 66
                                              .w), //shape:MaterialStateProperty.all(BorderSide(color: )),

                                      backgroundColor: Colors.grey.shade900,
                                    ),
                                    onPressed: () {
                                      showDialogg(context);
                                    },
                                    child: Text(
                                      "Enter as guest",
                                      style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: const Color.fromRGBO(
                                            205, 205, 205, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )),
      ),
    );
  }
}

/*child:SafeArea( child: Column(mainAxisAlignment: MainAxisAlignment.center,
children: [
SizedBox(height:170.0 ,width:35 ,child: Image.asset('images/Gu1de_darkversion.png',alignment: Alignment.topCenter,),),
fit:fill
],
),)*/
class FrostedGlassBox extends StatelessWidget {
  final double width, height;
  final Widget child;

  const FrostedGlassBox(
      {super.key,
      required this.width,
      required this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: SizedBox(
                  width: width, height: height, child: const Text(" ")),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 35, bottom: 22, left: 16, right: 16),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.20),
                        blurRadius: 30,
                        offset: const Offset(2, 2))
                  ],
                  borderRadius: BorderRadius.circular(20.0.r),
                  border: Border.all(
                      color: const Color.fromRGBO(4, 38, 30, 0.06),
                      width: 1.0.w),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(4, 38, 30, 0.06),
                      Color.fromRGBO(5, 5, 5, 0.76),
                    ], /* stops: [
                   0.0,
                  ]*/
                  )),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
