// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class Module_ressources_1CS extends StatelessWidget {
   const Module_ressources_1CS({super.key, required this.module, required this.url1});
final String module;
final String url1;
  @override
  Widget build(BuildContext context) { TextStyle kresources = GoogleFonts.inter(
        fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white);
    return Scaffold( backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text('Ressources for $module', style: kresources),
                  ],
                ),
              ),
              const SizedBox(
                height: 47,
              ),
              Row(
                children: [
                  Image(
                    image: const AssetImage('lib/images/drive.png'),
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text('Google drives', style: kresources),
                  SizedBox(
                    height: 13.h,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(url1);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch $url1';
                  }
                },
                child: Text(
                  'Link for the drive',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),]))));
  }
}