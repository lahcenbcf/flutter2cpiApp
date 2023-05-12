import 'package:flluter2cpi/pages/Main_Pages/EsiFlow/esi_flow.dart';
import 'package:flluter2cpi/pages/Main_Pages/Home/home.dart';
import 'package:flluter2cpi/test.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import '../../display_profile_pic.dart';
import '../Drawer/drawer.dart';


  int selectedIndex = 2;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  //
  //
List<Widget> pages = [
   const Home(), 
  const EsiFlow(), //for information
  const Test(), //for information
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
    
    print(selectedIndex);

    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar:selectedIndex == 0? PreferredSize(
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
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const DisplayProfilePic(22)
                  );
                }
              ),
              SizedBox(
                height: 39.h,
                width: 170.w,
                child: Image.asset(
                  "lib/images/white.png",
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
        
      ) : null,
      drawer:selectedIndex==0? const Drawerr() : null,
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
}
