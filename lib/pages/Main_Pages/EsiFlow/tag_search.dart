import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post & Comment classes/posts_tags.dart';

class TagSearch extends SearchDelegate {
  List<String> searchTags = eTags;
  List<String> searchResultTags = eTags;
  String ressult = "";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 5).w,
        child: InkWell(
          onTap: () => query = "",
          child: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      onTap: () => close(context, query),
      child: const Icon(
        FluentIcons.arrow_left_48_filled,
        size: 25,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, ressult);
    return  Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),

      child: Text(
                ressult,
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResultTags = searchTags
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return searchResultTags.isNotEmpty
        ? ListView.builder(
            itemCount:
                query == "" ? searchTags.length : searchResultTags.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              child: InkWell(
                onTap: () {ressult=query == "" ? searchTags[index] : searchResultTags[index]; showResults(context);},
                child: Text(
                  query == "" ? searchTags[index] : searchResultTags[index],
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        : Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
         
          child: Text(
              "tag not found",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
        );
  }
}
