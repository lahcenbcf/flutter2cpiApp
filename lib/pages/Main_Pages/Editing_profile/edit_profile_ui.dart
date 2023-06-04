// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/display_profile_pic.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Main_Pages/Editing_profile/second_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile_1st_screen extends StatefulWidget {
  const Profile_1st_screen({super.key});

  @override
  State<Profile_1st_screen> createState() => _Profile_1st_screenState();
}

class _Profile_1st_screenState extends State<Profile_1st_screen> {
  
 
  var divider = const Divider(
    color: Color.fromRGBO(119, 119, 119, 1),
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
    String ln="";
    String fn="";
    String mail="";
    String bio="";
  if(userInfo != null){
    fn=userInfo![2];
      ln=userInfo![1];
      mail=userInfo![3];
      bio=userInfo![9];
  }
       
    
    /*return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
          leading: Center(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    const DisplayProfilePic(22),
                    SizedBox(
                      height: 8.w,
                    ),
                    Text(
                      fn+" "+ln,
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  width: 176.w,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Profile_2nd_screen()));
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(32, 197, 122, 1),
                    ),
                  ),
                  child: Text(
                    'Edit profile',
                    style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 106.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    fn,
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                divider,
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(ln,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                divider,
                SizedBox(
                  height: 29.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(bio,
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: 65.h,
                ),
                divider,
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('E-mail:',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      SizedBox(width: 12.w),
                      Text(mail,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );*/
  
return Scaffold( 
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1), 
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(70.h), 
        child: AppBar( 
          backgroundColor: const Color.fromRGBO(35, 47, 56, 1), 
          leading: Center( 
            child: IconButton( 
              icon: const Icon( 
                Icons.arrow_back, 
                color: Colors.white, 
              ), 
              onPressed: () { 
                Navigator.of(context).pop(); 
              }, 
            ), 
          ), 
        ), 
      ), 
      body: Column(children: [ 
        SizedBox( 
          height: 50.h, 
        ), 
        Row( 
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
            Column( 
              children: [ 
                /*const CircleAvatar( 
                  backgroundImage: NetworkImage( 
                      'https://images.unsplash.com/photo-1677741001200-79163963249d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60'), 
                ),*/
                const DisplayProfilePic(22),
                SizedBox( 
                  height: 8.w, 
                ), 
                Text( 
                  ln, 
                  style: GoogleFonts.inter( 
                      fontSize: 16.sp, 
                      color: Colors.white, 
                      fontWeight: FontWeight.w600), 
                ) 
              ], 
            ), 
           
            TextButton( 
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Profile_2nd_screen()));}, 
              style: const ButtonStyle( 
                backgroundColor: MaterialStatePropertyAll( 
                  Color.fromRGBO(32, 197, 122, 1), 
                ), 
              ), 
              child: Text( 
                'Edit profile', 
                style: GoogleFonts.inter( 
                    fontSize: 16.sp, 
                    fontWeight: FontWeight.w400, 
                    color: Colors.white), 
              ), 
            ) 
          ], 
        ), 
        SizedBox( 
          height: 106.h, 
        ), 
        Column( 
            crossAxisAlignment: CrossAxisAlignment.start, 
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [ 
              Padding( 
                padding: const EdgeInsets.only(left: 8.0), 
                child: Row(children: [Text('First Name:', 
                        style:

                GoogleFonts.inter( 
                            fontSize: 14, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white)), 
                    SizedBox(width: 12.w), 
                    Text(fn, 
                        style: GoogleFonts.inter( 
                            fontSize: 12, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white))]),
              ), 
              SizedBox( 
                height: 20.h, 
              ), 
              divider, 
              SizedBox( 
                height: 25.h, 
              ), 
              Padding( 
                padding: const EdgeInsets.only(left: 8.0), 
                child: Row(children: [Text('Last Name:', 
                        style:

                GoogleFonts.inter( 
                            fontSize: 14, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white)), 
                    SizedBox(width: 12.w), 
                    Text(ln.toUpperCase(), 
                        style: GoogleFonts.inter( 
                            fontSize: 12, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white))])),
              SizedBox( 
                height: 20.h, 
              ), 
              divider, 
              SizedBox( 
                height: 29.h, 
              ), 
              Padding( 
                padding: const EdgeInsets.only(left: 8.0), 
                child: Row(children: [Text('Bio:', 
                        style:

                GoogleFonts.inter( 
                            fontSize: 14, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white)), 
                    SizedBox(width: 12.w), 
                    Text(bio, 
                        style: GoogleFonts.inter( 
                            fontSize: 12, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white))])),
              SizedBox( 
                height: 65.h, 
              ), 
              divider, 
              SizedBox( 
                height: 16.h, 
              ), 
              Padding( 
                padding: const EdgeInsets.only(left: 8.0), 
                child: Row( 
                  children: [ 
                    Text('E-mail:', 
                        style:

GoogleFonts.inter( 
                            fontSize: 14, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white)), 
                    SizedBox(width: 12.w), 
                    Text(mail, 
                        style: GoogleFonts.inter( 
                            fontSize: 12, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white)), 
                  ], 
                ), 
              ), 
            ]) 
      ]), 
    );

  }
}
