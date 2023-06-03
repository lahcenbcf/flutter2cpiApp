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
  ThemeData appBarTheme(BuildContext context) {
    
    return Theme.of(context).copyWith(
    //  indicatorColor: const Color.fromRGBO(255, 255, 255, 1),
      textTheme: TextTheme(
        
        titleLarge: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
          color: const Color.fromRGBO(217, 217, 217, 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        
      backgroundColor:  Color.fromRGBO(35, 47, 56, 1),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(67, 79, 88, 1),
        filled: true,
        
        contentPadding:    EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
        hintStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: const Color.fromRGBO(217, 217, 217, 1),
      ),
      focusedBorder: OutlineInputBorder(
borderSide: const BorderSide(color: Color.fromRGBO(67, 79, 88, 1)),
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          
        ),
        border:  OutlineInputBorder(
borderSide: const BorderSide(color: Color.fromRGBO(67, 79, 88, 1)),
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          
        ),
      )
    );
  }
  
  @override
  String get searchFieldLabel => 'Search for a tag';

  
 

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
            color: Color.fromRGBO(217, 217, 217, 1),
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
            color: Color.fromRGBO(217, 217, 217, 1),

      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, ressult);
    return Padding(
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
        .where((element) => element.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return searchResultTags.isNotEmpty
        ? Container(
            color: const Color.fromRGBO(35, 47, 56, 1),
            child: ListView.separated(
              itemCount:
                  query == "" ? searchTags.length : searchResultTags.length,
              separatorBuilder: (context, index) => Divider(
                color: const Color.fromRGBO(119, 119, 119, 1),
                thickness: 1,
                endIndent: 15.w,
                indent: 15.w,
              ),
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.h, horizontal: 37.0.w),
                child: InkWell(
                  onTap: () {
                    ressult = query == ""
                        ? searchTags[index]
                        : searchResultTags[index];
                    showResults(context);
                  },
                  child: Text(
                    query == "" ? searchTags[index] : searchResultTags[index],
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
          color: const Color.fromRGBO(35, 47, 56, 1),
          child: Center(
            child: Text(
              "tag not found",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        );
  }
}
