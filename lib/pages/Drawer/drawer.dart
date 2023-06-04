import 'package:flluter2cpi/display_profile_pic.dart';
import 'package:flluter2cpi/pages/Login_page/view_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../services/sharedServices.dart';
import '../Home_page/home_page_view.dart';
import '../Login_page/components/guest_box_view_model.dart';
import '../Main_Pages/Editing_profile/edit_profile_ui.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});
 
  
  @override
  Widget build(BuildContext context) {
     String fn="";
  String ln="";
  String mail="";
    if(userInfo != null){
    fn=userInfo![2];
      ln=userInfo![1];
      mail=userInfo![3];
  }

  final loginState=Provider.of<Vieww>(context,listen: false);
    final size = MediaQuery.of(context).size;
    final state = Provider.of<GuestBoxViewModel>(context, listen: false);
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    return Drawer(
      width: 276.0.w,
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.5).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 83.0.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DisplayProfilePic(31),
                SizedBox(width: 8.0.w),
              
                Text(
                        // ignore: unnecessary_null_comparison
                        fn !="" ? fn : "@username",
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ],
            ),
            SizedBox(height: 8.0.h),
         
              Text(
               mail!="" ? mail :"mail@esi-sba.dz",
                style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            SizedBox(height: 79.0.h),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Profile_1st_screen(),
                ));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FluentIcons.person_24_filled,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    size: iconSize * 26.0,
                  ),
                  SizedBox(width: 16.0.w),
                  Text(
                    "My account",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 55.0.h),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed("likedPosts"),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Iconsax.heart4,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    size: iconSize * 26.0,
                  ),
                  SizedBox(width: 16.0.w),
                  Text(
                    "Liked posts",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 55.0.h),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed("aboutTheApp"),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FluentIcons.info_28_regular,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    size: iconSize * 26.0,
                  ),
                  SizedBox(width: 16.0.w),
                  Text(
                    "About the app",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            //  const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.only(top: 300).h,
              child: InkWell(
                onTap: () async {
                  loginState.isLogged=false;
               await  SharedPrefService.pref.clear();
                 Navigator.of(context).pushReplacementNamed("choice");
                 
                },
                splashColor: const Color.fromRGBO(255, 0, 0, 0.7),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.5).w,
                  child: Text(
                    "Log out",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


