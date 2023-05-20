import 'dart:async';

import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/first_prepa_year.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/module_content.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/module_ressources.dart';
import 'package:flluter2cpi/Main_Pages/Esi_info/info_ui.dart';
import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_ui.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Login_page/components/guest_box_view_model.dart';
import 'package:flluter2cpi/pages/Main_Pages/Home/home.dart';
import 'package:flluter2cpi/pages/New_password/new_password_vm.dart';
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

import 'Main_Pages/Academic_years/academic_view.dart';
import 'Main_Pages/Editing_profile/final_edit_profile.dart';
import 'Main_Pages/Editing_profile/view_model.dart';
import 'Main_Pages/Editing_profile/view_model_1.dart';
import 'add_post/select_tag_view_model.dart';

Widget _defaultScreen = const HomePage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initPost.getStuckPost("lahcen");
  //for redirection
  await SharedPrefService.init();
  List<String>? loginInfoSession =
  SharedPrefService.pref.getStringList("loginInfo");
  debugPrint(loginInfoSession?[0]);
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
                  create:(context)=>NewPasswordViewModel(),
                ),
                ChangeNotifierProvider(create: (context)=>Post_Model()),
                ChangeNotifierProvider(create: ((context) =>TagModel() )),
                ChangeNotifierProvider(create: ((context)=>MODEL_profile())),
                ChangeNotifierProvider(create: ((context)=>Model()))
              ],
              builder: (context, child) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(useMaterial3: true),
                    routes: generateRoutes(context),
                    home:   SafeArea(
                      child: SplashScreen(),
                    ));
              });
        });
  }
  
}
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    _defaultScreen
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [ Color.fromRGBO(3, 117, 89, 0.85),
              //      Color.fromRGBO(1, 61, 46, 0.8), //1
              Color.fromRGBO(0, 75, 57, 0.88),
              Color.fromRGBO(41, 45, 54, 0.97), //2
              Color.fromRGBO(39, 42, 48, 0.98),
              Color.fromRGBO(24, 26, 32, 0.97),
              Color.fromRGBO(0, 0, 0, 0.98),
            ],
            
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "lib/images/logo_white.png",
                  height: 300.0,
                  width: 300.0,
                ),
                
              ],
            ),

            const CircularProgressIndicator( backgroundColor: Colors.black,
              valueColor:  AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}