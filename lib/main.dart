import 'package:flluter2cpi/pages/CorePost/components/DisplayComments/display_comment_vm.dart';
import 'package:flluter2cpi/pages/CorePost/core_post_vm.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Login_page/components/guest_box_view_model.dart';
import 'package:flluter2cpi/pages/New_password/new_password_vm.dart';
import 'package:flluter2cpi/pages/Post/components/likeButton/like_button_vm.dart';
import 'package:flluter2cpi/pages/School_year/school_year_view_model.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view_model.dart';
import 'package:flluter2cpi/pages/Login_page/view_model.dart';
import 'package:flluter2cpi/pages/forgot_pass/forgot_view_model.dart';
import 'package:flluter2cpi/pages/otp_screen/otp_view_model.dart';
import 'package:flluter2cpi/routes.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget _defaultScreen = const HomePage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  String? loginInfoSession = SharedPrefService.pref.getString("userInfo");
  bool? isGuest = SharedPrefService.pref.getBool(
      "isGuest"); // To limit the priviliges of the guest like reading only the posts no edit no add no delete no comments // is to say Hello to guest so we need the guest Name
  if (loginInfoSession != null || isGuest != null) {
    _defaultScreen = const HomePage();
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
                  create: (context) => View(),
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
                ChangeNotifierProvider(
                  create: (context) => LikeButtonViewModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => CorePostViewModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => DisplayCommentsViewModel(),
                ),
              ],
              builder: (context, child) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(useMaterial3: true),
                    routes: generateRoutes(context),
                    home: SafeArea(
                      child: _defaultScreen,
                    ));
              });
        });
  }
}
