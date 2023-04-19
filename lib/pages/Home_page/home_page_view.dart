import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  int selectedIndex = 0;

  List<Widget> pages = [
     //for information
    const Center(child: Text("1")), //for information
    const Center(child: Text("2")), //for information
    const Center(child: Text("3")), //for information
    const Center(child: Text("4")), //for information
  ];
  //

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
      bottomNavigationBar: Padding(
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
          onTabChange: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          tabs: [
            GButton(
              icon: FluentIcons.home_12_filled,
              iconColor: Colors.white,
              text: "Home",
              textStyle: textStyle,
            ),
            GButton(
              icon: FluentIcons.code_24_filled,
              iconColor: Colors.white,
              text: "Esi-Flow",
              textStyle: textStyle,
            ),
            GButton(
              icon: Iconsax.book_1,
              iconColor: Colors.white,
              text: "Academic",
              textStyle: textStyle,
            ),
            GButton(
              icon: FluentIcons.info_24_filled,
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
