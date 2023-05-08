import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
import 'package:flluter2cpi/Main_Pages/Editing_profile/final_edit_profile.dart';
import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_profile_ui.dart';

class Profile_2nd_screen extends StatefulWidget {
  const Profile_2nd_screen({super.key});

  @override
  State<Profile_2nd_screen> createState() => _Profile_2nd_screenState();
}

class _Profile_2nd_screenState extends State<Profile_2nd_screen> {
  File? imageFile;

  var divider = const Divider(
    color: Color.fromRGBO(119, 119, 119, 1),
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
     Future takePhoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
        //  state.imageFile = imageFile;
        }
      });
    }

    Future choosephoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
         // state.imageFile = imageFile;
        }
      });
    }

    Widget bottomSheet() {
      return Container(
        height: 200.h,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            const Text(
              "Choose Post photo",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto();
                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  choosephoto();
                },
                label: const Text("Gallery"),
              ),
            ])
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 47, 56, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(35, 47, 56, 1),
          leading: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile_1st_screen()));
              },
            ),
          ),
          title: Text(
            'Edit profile',
            style: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          actions: [
            TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(32, 197, 122, 1))),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(onTap:(){showModalBottomSheet(
                                            context: context,
                                            builder: ((builder) => bottomSheet()),);} ,
                    child: CircleAvatar(radius: 60,
                      backgroundImage:imageFile!= null ?  FileImage(
                                                File(imageFile!.path),
                                                
                                              ):null,child:  imageFile== null ? Icon(Icons.person) : null,
                    ),
                  ),
                  SizedBox(
                    height: 8.w,
                  ),
                  Text(
                    'Change picture',
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  
                ],
              ),
              
              
              
            ],
          ),
          SizedBox(
            height: 89.h,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'First name',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
                  child: Text('Last name',
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
                  child: Text('Bio',
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
                      Text('user@esi-sba.com',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),
                ), SizedBox(
                  height: 20.h,
                ),
                divider,
                SizedBox(
                  height: 29.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Password :',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                              SizedBox(width: 12.w,),
                              Text('.........',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                              SizedBox(width: 190.w,),
                              TextButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile_3rd_screen())), child: Text('Edit',style: GoogleFonts.inter(fontSize: 16.sp,fontWeight:FontWeight.w500 ,color: Color.fromRGBO(32, 197, 122, 1)),))
                              
                    ],
                    
                  ),
                ), divider,
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Linkedin lik:',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      SizedBox(width: 12.w),
                      Text('/////////',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),
        ),]), SizedBox(
                  height: 20.h,
                ),
         divider,
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Gitub link:',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      SizedBox(width: 12.w),
                      Text('///////////',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),), SizedBox(
                  height: 20.h,
                ),SizedBox(
                  height: 20.h,
                ),
         divider,
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Telegram link:',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      SizedBox(width: 12.w),
                      Text('///////////',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  ),), SizedBox(
                  height: 20.h,
                )]),
      ),
    );
  }
}
