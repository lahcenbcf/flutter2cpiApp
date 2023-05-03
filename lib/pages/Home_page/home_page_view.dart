import 'package:flluter2cpi/pages/CorePost/components/comment_class.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  int selectedIndex = 0;

  //
  @override
  void initState(){
    
  }

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      //for information
      Center(
        child: Post(
          likesCount: 30,
          commentsCount: 29,
          title: "How to fix 'NoSuch MethodError' in Flutter app?",
          description: "I have a Flutter app that is crashing when I try to navigate to a new screen. The error message I'm getting is Navigator operation requested with a context that does not include a Navigator.I have tried searching for a solution online and came across some suggestions, such as wrapping the widget that triggers the navigation with a Builder widget or using a MaterialApp instead of a CupertinoApp. However, none of these solutions worked for me.I also tried checking if the issue is caused by any third-party packages that I'm using, but I couldn't find any conflicting packages or versions.I'm not sure what else to try or where to look for a solution. Can anyone help me understand what is causing this error and how to fix it? Thank you in advance.",
          date: DateTime.now(),
          userName: "Aboubakr",
          email: "la.belmiloud",
          tag: "flutter",
          comments: [
            Comment(
              userName: "me",
              email: "belmiloud@esi-sba.dz",
              comment: "Hi, it looks like the error message indicates that the context you're using to perform the Navigator operation doesn't include a Navigator. You can try wrapping the widget tree of the destination screen with a MaterialPageRoute or a CupertinoPageRoute, depending on the platform you're developing for. This will ensure that a Navigator is present in the context when the navigation operation is performed.",
              likesCount: 1,
              commentsCount: 0,
              date: DateTime.now().subtract(
                const Duration(minutes: 1),
              ),
            ),
            Comment(
              userName: "laid",
              email: "la.belmiloud@esi-sba.dz",

              comment: "this is besma's comment\n with three\n lines",
              likesCount: 0,
              commentsCount: 0,
              date: DateTime.now().subtract(
                const Duration(days: 60),
              ),
            ),
            Comment(
              userName: "aboubakr",
              email: "a.belmiloud@esi-sba.dz",

              comment: "this is besma's comment\n with three\n lines",
              likesCount: 30,
              commentsCount: 2,
              date: DateTime.now().subtract(
                const Duration(days: 893),
              ),
            ),
          ],
        ),
      ), //for information
      const Center(child: Text("2")), //for information
      const Center(child: Text("3")), //for information
      const Center(child: Text("4")), //for information
    ];
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(113.h),
        child: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 33.h),
          padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 10.w),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(67, 69, 75, 1),
              borderRadius: BorderRadius.circular(25.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 21 * iconSize,
                backgroundColor: const Color.fromRGBO(39, 39, 39, 1),
                child: Icon(
                  FluentIcons.person_24_filled,
                  color: Colors.white,
                  size: 32 * iconSize,
                ),
              ),
              SizedBox(
                height: 39.h,
                width: 170.w,
                child: Image.asset(
                  "lib/images/logo.png",
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Icon(
                Iconsax.notification5,
                color: Colors.white,
                size: 32 * iconSize,
              )
            ],
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 0.5))),
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          gap: 12.w, // between the icon and the text
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabMargin: EdgeInsets.symmetric(horizontal: 7.5.w),
          // the color of the whole nav bar
          backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
          tabBackgroundColor: const Color.fromRGBO(32, 197, 122, 1),

          activeColor: Colors.white,
          tabBorderRadius: 32.r,
          iconSize: 24 * iconSize,
          selectedIndex: selectedIndex,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInToLinear,
          onTabChange: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          tabs: [
            GButton(
              icon: selectedIndex == 0
                  ? FluentIcons.home_12_filled
                  : FluentIcons.home_12_regular,
              iconColor: Colors.white,
              text: "Home",
              textStyle: textStyle,
            ),
            GButton(
              icon: selectedIndex == 1
                  ? FluentIcons.code_24_filled
                  : FluentIcons.code_24_regular,
              iconColor: Colors.white,
              iconSize: 32 * iconSize,
              text: "Esi-Flow",
              textStyle: textStyle,
            ),
            GButton(
              icon: selectedIndex == 2 ? Ionicons.book : Ionicons.book_outline,
              iconColor: Colors.white,
              text: "Academic",
              textStyle: textStyle,
            ),
            GButton(
              icon: selectedIndex == 3
                  ? FluentIcons.info_24_filled
                  : FluentIcons.info_24_regular,
              iconColor: Colors.white,
              text: "Information",
              textStyle: textStyle,
            ),
          ],
        ),
      ),
    );
  }

//
//
//
//
}
