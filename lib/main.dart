

import 'package:flluter2cpi/pages/login/log%20in.dart';
import 'package:flluter2cpi/pages/login/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
            ChangeNotifierProvider(create: (context) => View(),)
          ],
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SafeArea(
                child: Login(),
              ),
            );
          },
        );
      },
    );
  }
}

