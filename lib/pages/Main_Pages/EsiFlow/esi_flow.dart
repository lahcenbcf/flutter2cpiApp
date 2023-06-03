import 'package:flluter2cpi/pages/Main_Pages/EsiFlow/tag_search.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post-Info/post_info_v.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../../display_profile_pic.dart';
import '../../../main.dart';
import '../../Post/post_v.dart';
import '../../add_post/post_ui.dart';
import '../Editing_profile/edit_profile_ui.dart';

int selectedTab = 1;

class EsiFlow extends StatefulWidget {
  const EsiFlow({super.key});

  @override
  State<EsiFlow> createState() => _EsiFlowState();
  
}

class _EsiFlowState extends State<EsiFlow> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Post> filtered = ePosts;
    final size = MediaQuery.of(context).size;
    late List<PostInfo> result;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final TabController controller =
        TabController(length: eTags.length + 1, vsync: this);
    @override
    void dispose() {
      super.dispose();
      controller.dispose();
      ApiServices.saveTags();
    }
  

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0.w, top: 2.0.h),
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Profile_1st_screen(),
                ));
              },
              child: const DisplayProfilePic(22)),
        ),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16).w,
        //     child: InkWell(
        //       onTap: () async {
        //         String res = await showSearch(
        //           context: context,
        //           delegate: TagSearch(),
        //         );

        //         setState(() {
        //           selectedTab = eTags.indexOf(res) + 1;
        //           controller.animateTo(
        //             selectedTab,
        //             curve: Curves.slowMiddle,
        //           );
        //         });
        //       },
        //       child: Icon(
        //         Icons.search_outlined,
        //         color: Colors.white,
        //         size: 30 * iconSize,
        //       ),
        //     ),
        //   ),
        // ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Explore",
              style: GoogleFonts.poppins(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationThickness: 2.h,
                decorationColor: const Color.fromRGBO(32, 197, 122, 1),
              ),
            ),
            SizedBox(width: 3.w),
            Text(
              "Esi Flow",
              style: GoogleFonts.poppins(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 38.0.h),
              InkWell(
                onTap: () async {
                  String res = await showSearch(
                    context: context,
                    delegate: TagSearch(),
                  );

                  setState(() {
                    selectedTab = eTags.indexOf(res) + 1;
                    controller.animateTo(
                      selectedTab,
                      curve: Curves.slowMiddle,
                    );
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0).w,
                  padding: const EdgeInsets.symmetric(vertical: 8.0).w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.search_outlined,
                        color: const Color.fromRGBO(33, 33, 33, 1),
                        size: 30 * iconSize,
                      ),
                      SizedBox(width: 30.w),
                      Text(
                        "Search by tag",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(33, 33, 33, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 38.0.h),
              TabBar(
                isScrollable: true,
                controller: controller,
                indicatorColor: Colors.transparent,
                indicatorWeight: 0.00000000000000000001,
                onTap: (value) {
                  setState(() {
                    selectedTab = value;
                  });
                },
                tabs: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 22.w),
                    decoration: BoxDecoration(
                      color: selectedTab == 0
                          ? const Color.fromRGBO(32, 197, 122, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "All",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  for (var tag in eTags)
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.h, horizontal: 22.w),
                      //  margin: const EdgeInsets.only(right: 8).w,
                      decoration: BoxDecoration(
                        color: selectedTab == eTags.indexOf(tag) + 1
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: filtered.isNotEmpty
          ? Builder(builder: (context) {
              List<Post> x = selectedTab != 0
                  ? filtered
                      .where((element) =>
                          element.tag == eTags[selectedTab - 1] &&
                          !element.isReported)
                      .toList()
                  : [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  if (selectedTab != 0)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          eTags[selectedTab - 1],
                          style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 11.w),
                        followedTags.contains(eTags[selectedTab - 1])
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    followedTags.remove(eTags[selectedTab - 1]);
                                    int x = originalETags
                                        .indexOf(eTags[selectedTab - 1]);
                                    String y = eTags[selectedTab - 1];
                                    eTags.remove(eTags[selectedTab - 1]);
                                    eTags.insert(x, y);
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: const Color.fromRGBO(
                                          119, 119, 119, 1)),
                                  child: Text(
                                    "Unfollow",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    followedTags.insert(
                                        0, eTags[selectedTab - 1]);
                                    String x = eTags.removeAt(selectedTab - 1);
                                    eTags.insert(0, x);
                                    selectedTab = 1;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: const Color.fromRGBO(
                                          32, 197, 122, 1)),
                                  child: Text(
                                    "Follow",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  if (selectedTab != 0) SizedBox(height: 30.h),
                  selectedTab != 0
                      ? x.isEmpty
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * (0.8),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "no post available for ${eTags[selectedTab - 1]}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(child: DisplayPosts(filteredd: x))
                      : Expanded(
                          child: DisplayPosts(
                              filteredd: filtered
                                  .where((element) => !element.isReported)
                                  .toList())),
                ],
              );
            })
          : Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0).h,
                child: Text(
                  "no post is available",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
      floatingActionButton: !isGuestt
          ? FloatingActionButton(
              shape: const CircleBorder(side: BorderSide()),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const AddPostScreen())));
              },
              backgroundColor: const Color.fromRGBO(32, 197, 122, 1),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}

class DisplayPosts extends StatelessWidget {
  const DisplayPosts({
    super.key,
    required this.filteredd,
  });

  final List<Post> filteredd;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Post(
          image: filteredd[index].image,
            type: filteredd[index].type,
            profilePic: filteredd[index].profilePic,
            likesCount: filteredd[index].likesCount,
            commentsCount: filteredd[index].commentsCount,
            title: filteredd[index].title,
            description: filteredd[index].description,
            date: filteredd[index].date,
            userName: filteredd[index].userName,
            email: filteredd[index].email,
            tag: filteredd[index].tag,
            comments: filteredd[index].comments,
            isLiked: filteredd[index].isLiked,
            controllerTag: filteredd[index].controllerTag,
            isBlack: false,
            links: filteredd[index].links);
      },

      separatorBuilder: (context, index) => Divider(
        color: Colors.white,
        height: 3.h,
        thickness: 1,
        endIndent: 15.w,
        indent: 15.w,
      ),
      itemCount: filteredd.length,
    );
  }
}

//  InkWell(
//               onTap: () async {
//                 String res = await showSearch(
//                   context: context,
//                   delegate: TagSearch(),
//                 );

//                 setState(() {
//                   selectedTab = eTags.indexOf(res) + 1;
//                   controller.animateTo(
//                     selectedTab,
//                     curve: Curves.slowMiddle,
//                   );
//                 });
//               },