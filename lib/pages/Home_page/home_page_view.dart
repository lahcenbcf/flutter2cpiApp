import 'dart:convert';

import 'package:flluter2cpi/home_shimmer.dart';
import 'package:flluter2cpi/main.dart';
import 'package:flluter2cpi/pages/Main_Pages/Academic_years/academic_view.dart';
import 'package:flluter2cpi/pages/Main_Pages/EsiFlow/esi_flow.dart';
import 'package:flluter2cpi/pages/Main_Pages/Home/home.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../display_profile_pic.dart';
import '../Drawer/drawer.dart';
import '../Main_Pages/Editing_profile/edit_profile_ui.dart';
import '../Main_Pages/Esi_info/info_ui.dart';
import '../Post & Comment classes/posts_tags.dart';
import '../Post/post_v.dart';
import 'Home_page_viewM.dart';

int selectedIndex = 0;
bool isAdmin=true;
List<String>?userInfo;
String?guestName;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
 

  late Future<List<List<Post>>> result;
  void initState(){
    // TODO: implement initState
    super.initState();
    //Home_page_viewM.updateTags();
    if(userInfo != null){
      result = Home_page_viewM.initPosts(userInfo != null ? userInfo![0] : "");   
    }else{
      //final pref = await SharedPreferences.getInstance();
      result = Home_page_viewM.initPosts(guestName!);
    }
    
    
  }

  


  

  List<Widget> pages = [
    const Home(),
    const EsiFlow(), //for information
    const Academic_page(), //for information
    const Esi_info()
  ];
  //

  TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  
 // bool notFetched=false;
   /*Future<void> fetchData() async {
    await SharedPrefService.init();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String?stackPosts = pref.getString('ePosts');
    String?academicPosts = pref.getString('aPosts');
    String?iPosts = pref.getString('iPosts');

    if (stackPosts != null && academicPosts != null && iPosts != null  ) {
      // Stored posts exist, parse and use them
     
        ePosts = (jsonDecode(stackPosts) as List)
            .map<Post>((p) => Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount: p?["comments"].length, title: p?["title"], description: p?["context"], links: p?["links"], date: p?["date"], userName: p?["author"], email: p?["email"], tag: p?["tag"], comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], profilePic: p?["profilePic"] != "" ? (p?["profilePic"]): "", image:p?["image"] !="" ? (p?["image"]):"", isBlack: p?["isBlack"], isReported: p?["isReported"]))
            .toList();
             aPosts = (jsonDecode(academicPosts) as List)
            .map<Post>((p) => Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount: p?["comments"].length, title: p?["title"], description: p?["context"], links: p?["links"], date: p?["date"], userName: p?["author"], email: p?["email"], tag: p?["tag"], comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], profilePic: p?["profilePic"] != "" ? (p?["profilePic"]): "", image:p?["image"] !="" ? (p?["image"]):"", isBlack: p?["isBlack"], isReported: p?["isReported"]))
            .toList();
             infoPosts = (jsonDecode(iPosts) as List)
            .map<Post>((p) => Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount: p?["comments"].length, title: p?["title"], description: p?["context"], links: p?["links"], date: p?["date"], userName: p?["author"], email: p?["email"], tag: p?["tag"], comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], profilePic: p?["profilePic"] != "" ? (p?["profilePic"]): "", image:p?["image"] !="" ? (p?["image"]):"", isBlack: p?["isBlack"], isReported: p?["isReported"]))
            .toList();
     
    } else {
      notFetched=true;
      //prefs.setString('posts', jsonEncode(posts));
    }
  
   }*/
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //fetchData();
   
    return FutureBuilder(
        future: result,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            ePosts = snapshot.data![0];
            aPosts = snapshot.data![1];
            infoPosts = snapshot.data![2];
            
            return Scaffold(
              backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
              appBar: selectedIndex == 0
                  ? PreferredSize(
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
                            Builder(builder: (context) {
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
                            }),
                            SizedBox(
                              height: 39.h,
                              width: 170.w,
                              child: Image.asset(
                                "lib/images/white.png",
                                fit: BoxFit.contain,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Builder(builder: (context) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const Profile_1st_screen(),
                                    ));
                                  },
                                  child: const DisplayProfilePic(22));
                            }),
                          ],
                        ),
                      ),
                    )
                  : null,
              drawer: selectedIndex == 0 && !isGuestt ? const Drawerr() : null,
              body: pages[selectedIndex],
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
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const HomeShimmer();
          }
        }));
  }
}
