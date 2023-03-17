

import 'package:flluter2cpi/pages/Login_page/log%20in.dart';
import 'package:flluter2cpi/pages/Login_page/view_model.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
//import 'package:flluter2cpi/pages/login/log%20in.dart';
//import 'package:flluter2cpi/pages/login/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flluter2cpi/pages/otp_screen/otp_view.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => View(),),
            ChangeNotifierProvider(create: (context)=>View_model())
          ],
          builder: (context, child) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SafeArea(
                child: Forgot_pass(),
              ),
            );
          },
        );
      },
    );
  }
}

