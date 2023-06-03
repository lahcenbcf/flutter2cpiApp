import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';

import 'display_profile_pic.dart';

class HomeShimmer extends StatefulWidget {
  const HomeShimmer({super.key});

  @override
  State<HomeShimmer> createState() => _HomeShimmerState();
}

class _HomeShimmerState extends State<HomeShimmer> {
   TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
                      preferredSize: Size.fromHeight(113.h),
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 33.h),
                        padding: EdgeInsets.symmetric(
                            vertical: 17.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(67, 69, 75, 1),
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            /*Builder(builder: (context) {
                              return InkWell(
                                onTap: () async {
                                  if (isGuestt) {
                                    final pref =
                                        await SharedPreferences.getInstance();
                                    pref.setBool("isGuest", false);
                                    isGuestt = false;
                                    //
                                    // clear loggin session
                                    //
                                    Navigator.of(context)
                                        .pushReplacementNamed("choice");
                                  }
                                  Scaffold.of(context).openDrawer();
                                },
                                child: isGuestt
                                    ? Icon(
                                        FluentIcons.arrow_exit_20_filled,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        size: 30 * iconSize,
                                      )
                                    : Icon(
                                        FluentIcons.navigation_24_filled,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        size: 30 * iconSize,
                                      ),
                              );
                            }),*/
                           const Icon(
                                        FluentIcons.navigation_24_filled,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        size: 30,
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
                            /*Builder(builder: (context) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Profile_1st_screen(),
                                    ));
                                  },
                                  child: const DisplayProfilePic(22));
                            }),*/
                            const DisplayProfilePic(22)
                          ],
                        ),
                      ),
                    ),
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
          child: Column(
                mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0.h,
              ),
              const Shimmerr(width: 85, height: 22, radius: 0),
              SizedBox(
                height: 23.0.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < 6; i++)
                      const Shimmerr(width: 102, height: 40, radius: 10),
                  ],
                ),
              ),
              SizedBox(
                height: 31.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.white, width: 0.5))),
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: GNav(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                  gap: 12.w, // between the icon and the text
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  tabMargin: EdgeInsets.symmetric(horizontal: 7.5.w),
                  // the color of the whole nav bar
                  backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
                  tabBackgroundColor: const Color.fromRGBO(32, 197, 122, 1),

                  activeColor: Colors.white,
                  tabBorderRadius: 32.r,
                  iconSize: 24,
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
                      iconSize: 32,
                      text: "Esi-Flow",
                      textStyle: textStyle,
                    ),
                    GButton(
                      icon: selectedIndex == 2
                          ? Ionicons.book
                          : Ionicons.book_outline,
                      iconColor: Colors.white,
                      text: "Academic",
                      textStyle: textStyle,
                    ),
                    GButton(
                      icon: selectedIndex == 3
                          ? FluentIcons.news_28_filled
                          : FluentIcons.news_28_regular,
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

class Shimmerr extends StatelessWidget {
  const Shimmerr(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});
  final double width;
  final double height;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5).w,
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: const Color.fromRGBO(0, 0, 0, 0.8),
        highlightColor: const Color.fromRGBO(0, 0, 0, 0.5),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1],
              colors: [
                Color.fromRGBO(0, 0, 0, 0.73),
                Color.fromRGBO(30, 30, 30, 0.73),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.90);
    return LimitedBox(
      maxHeight: 250.h,
      child: PageView.builder(
        itemCount:4,
           
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5).w,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: const Color.fromRGBO(0, 0, 0, 0.8),
            highlightColor: const Color.fromRGBO(0, 0, 0, 0.5),
            child: Container(
              width: 360.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.73),
                    Color.fromRGBO(30, 30, 30, 0.73),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
