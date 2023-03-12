import 'package:flluter2cpi/pages/Login_page/components/guest_box_view_model.dart';
import 'package:flluter2cpi/pages/School_year/school_year_view_model.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view.dart';
import 'package:flluter2cpi/pages/Login_page/login.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:flluter2cpi/pages/Login_page/view_model.dart';
import 'package:flluter2cpi/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
                ChangeNotifierProvider(
                  create: (context) => SignUpViewModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => SchoolYearViewModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => GuestBoxViewModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => View(),
                )
              ],
              builder: (context, child) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(useMaterial3: true),
                    routes: generateRoutes(context),
                    home:const SafeArea(
                      child: SignUp(),
                    ));
              });
        });
  }
}
