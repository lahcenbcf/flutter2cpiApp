import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/pages/Main_Pages/EsiFlow/tag_search.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Home_page/home_page_view.dart';
import '../../Post/post_v.dart';

int selectedTab = 0;

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

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final TabController controller =
        TabController(length: eTags.length + 1, vsync: this);
    if (selectedTab != 0) {
      print(eTags[selectedTab - 1]);
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16).w,
            child: InkWell(
              onTap: () async {
                String res = await showSearch(
                  context: context,
                  delegate: TagSearch(),
                );

                setState(() {
                  selectedTab = eTags.indexOf(res) + 1;
                  controller.animateTo(selectedTab,
                      curve: Curves.fastOutSlowIn);
                });
              },
              child: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 30 * iconSize,
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Explore",
              style: GoogleFonts.poppins(
                fontSize: 28.sp,
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
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                isScrollable: true,
                controller: controller,
                indicatorColor: Colors.transparent,
                indicatorWeight: 0.00001,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                              int x =
                                  originalETags.indexOf(eTags[selectedTab - 1]);
                              String y = eTags[selectedTab - 1];
                              eTags.remove(eTags[selectedTab - 1]);
                              eTags.insert(x, y);
                            });
                          },
                          child: Icon(
                            FluentIcons.dismiss_circle_48_filled,
                            color: Colors.red,
                            size: 28 * iconSize,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              followedTags.insert(0, eTags[selectedTab - 1]);
                              String x = eTags.removeAt(selectedTab - 1);
                              eTags.insert(0, x);
                              selectedTab = 1;
                            });
                          },
                          child: Icon(
                            FluentIcons.add_circle_24_filled,
                            color: const Color.fromRGBO(32, 197, 122, 1),
                            size: 28 * iconSize,
                          ),
                        ),
                ],
              ),
            if (selectedTab != 0) SizedBox(height: 30.h),
            selectedTab != 0
                ? filtered
                        .where(
                            (element) => element.tag == eTags[selectedTab - 1])
                        .toList()
                        .isEmpty
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
                    : DisplayPosts(filtered: filtered)
                : DisplayPosts(filtered: filtered),
        
          ],
          
        ),
      
      ),
      floatingActionButton:    isGuest ==false
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
                ))
            : null
    );
  }
}

class DisplayPosts extends StatelessWidget {
  const DisplayPosts({
    super.key,
    required this.filtered,
  });

  final List<Post> filtered;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return selectedTab == 0
            ? filtered[index]
            : filtered
                .where((element) => element.tag == eTags[selectedTab - 1])
                .toList()[index];
      },
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: selectedTab == 0
          ? filtered.length
          : filtered
              .where((element) => element.tag == eTags[selectedTab - 1])
              .toList()
              .length,
    );
  }
}
