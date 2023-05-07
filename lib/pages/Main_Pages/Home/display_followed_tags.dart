import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class DisplayFollowedTags extends StatefulWidget {
  const DisplayFollowedTags({super.key, });

  @override
  State<DisplayFollowedTags> createState() => _DisplayFollowedTagsState();
}

class _DisplayFollowedTagsState extends State<DisplayFollowedTags> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: followedTags.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 7).w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      String w= followedTags.removeAt(index);
                            int x = originalETags.indexOf(w);
                           
                            eTags.remove(w);
                            eTags.insert(x, w);
                    });
                  },
                  child: Icon(
                    FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                    size: 24 * iconSize,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  followedTags[index],
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
