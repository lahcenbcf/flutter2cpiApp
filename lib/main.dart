import 'package:flluter2cpi/pages/Choice_page/choice_v.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Login_page/components/guest_box_view_model.dart';
import 'package:flluter2cpi/pages/New_password/new_password_vm.dart';
import 'package:flluter2cpi/pages/OnBoarding_Screen/on_boarding_screen.dart';
import 'package:flluter2cpi/pages/School_year/school_year_view_model.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:flluter2cpi/pages/Login_page/view_model.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
import 'package:flluter2cpi/pages/otp_screen/otp_view_model.dart';
import 'package:flluter2cpi/routes.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _defaultScreen = const OnBoardingScreen();

void main() async {
  
    

  WidgetsFlutterBinding.ensureInitialized();
  //await initPost.getStuckPost("lahcen");
  //for redirection
  await SharedPrefService.init();
  final pref = await SharedPreferences.getInstance();
  final showChoicePage = pref.getBool("showChoicePage") ?? false;
  if (showChoicePage) {
    _defaultScreen = const Choice();
  }
  List<String>? loginInfoSession =
  SharedPrefService.pref.getStringList("loginInfo");
  debugPrint(loginInfoSession?[0]);
  bool? isGuest = SharedPrefService.pref.getBool(
      "isGuest"); // To limit the priviliges of the guest like reading only the posts no edit no add no delete no comments // is to say Hello to guest so we need the guest Name
      pref.clear();
  
  if (loginInfoSession != null || isGuest != null ) {
    _defaultScreen = const HomePage();
  }else{
      _defaultScreen = const Choice();
  }
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
              create: (context) => Vieww(),
            ),
            ChangeNotifierProvider(
              create: (context) => View_model(),
            ),
            ChangeNotifierProvider(
              create: (context) => Otp_view(),
            ),
            ChangeNotifierProvider(
              create: (context) => NewPasswordViewModel(),
            ),
            // ChangeNotifierProvider(
            //   create: (context) => LikeButtonViewModel(),
            // ),
          ],
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
                 theme: ThemeData(useMaterial3: true),
              routes: generateRoutes(context),

              home: const SafeArea(
                child: HomePage(),
              ),
            );
          },
        );
      },
    );
  }
}
