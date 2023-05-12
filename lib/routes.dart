import 'package:flluter2cpi/pages/Choice_page/choice_v.dart';
import 'package:flluter2cpi/pages/Drawer/about_the_app_page.dart';
import 'package:flluter2cpi/pages/Drawer/drawer.dart';
import 'package:flluter2cpi/pages/Drawer/liked_posts.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Login_page/login.dart';
import 'package:flluter2cpi/pages/New_password/new_password_v.dart';
import 'package:flluter2cpi/pages/OnBoarding_Screen/on_boarding_screen.dart';
import 'package:flluter2cpi/pages/School_year/school_year.view.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view.dart';
import 'package:flluter2cpi/pages/otp_screen/otp_view.dart';
import 'package:flutter/material.dart';



generateRoutes(BuildContext context) {
  return {
    "SignUp": (context) => const SignUp(),
    "SchoolYear": (context) => const SchoolYear(),
    "HomePage":(context)=>const HomePage(),
    "LogIn":(context)=>const Login(),
    "forgotPassword":(context)=>const ForgotPass(),
    "otpView":(context)=>const Otp(),
    "newPassword":(context)=>const NewPassword(),
    "choice":(context)=>const Choice(),
    "onBoarding":(context)=>const OnBoardingScreen(),
    "drawer":(context)=>const Drawerr(),
    "aboutTheApp":(context)=>const AboutTheApp(),
    "likedPosts":(context)=>const LikedPosts(),
   
  };
}
