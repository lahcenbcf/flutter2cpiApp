import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/view_model.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/pages/Main_Pages/Editing_profile/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Home_page/home_page_view.dart';

class Profile_3rd_screen extends StatefulWidget {
  const Profile_3rd_screen({super.key});

  @override
  State<Profile_3rd_screen> createState() => _Profile_3rd_screenState();
}

class _Profile_3rd_screenState extends State<Profile_3rd_screen> {
  File? imageFile;
  //String? imagePath;
  var divider = const Divider(
    color: Color.fromRGBO(119, 119, 119, 1),
    height: 1,
  );
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final state2 = Provider.of<MODEL_profile>(context, listen: false);
    Future takePhoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
          state2.imageFile = imageFile;
        }
      });
    }

    Future choosephoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
        state2.imageFile = imageFile;
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
            const SizedBox(
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
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          centerTitle: true,
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
          title: Text(
            'Edit password',
            style: GoogleFonts.inter(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: imageFile != null
                          ? FileImage(
                              File(imageFile!.path),
                            )
                          : null,
                      child:
                          imageFile == null ? const Icon(Icons.person) : null,
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
          Consumer<MODEL_profile>(
            builder: (BuildContext context, value, Widget? child) => Form(
              key: formState,
              child: Column(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Old password :',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        SizedBox(
                          width: 12.w,
                        ),
                        SizedBox(
                            width: 250.w,
                            child: TextFormField(
                              validator: (String? val) => value.confirmold(val),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                fillColor: Colors.white,
                              ),
                              controller: value.oldpss,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text('New password:',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        SizedBox(width: 12.w),
                        SizedBox(
                            width: 250.w,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                fillColor: Colors.white,
                              ),
                              controller: value.newpass,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Confirm password',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        //   SizedBox(width: 12.w),
                        SizedBox(
                          width: 250.w,
                          child: TextFormField(
                            validator: (String? val) =>
                                value.confirmPasswordValidator(val),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              fillColor: Colors.white,
                            ),
                            controller: value.confirm_new,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(32, 197, 122, 1))),
                onPressed: () async {
                  if (formState.currentState != null) {
                    if (formState.currentState!.validate()) {
                      //hna nab3ath facebook
                      showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const Dialog(
                                                  backgroundColor: Colors.transparent,

                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: CircularProgressIndicator(
                                                                                                  color: Color.fromRGBO(
                                                        32, 197, 122, 1),
                                                                                                  
                                                                                                ),
                                                    ),
                                                  ),
                                                ),
                                          );
                      print("ayjat");
                      await state2.editPassword(/*imageFile!, imagePath!*/);
                      if(state2.message=="succces your password updated !"){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage() ));
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      content: Text(
                                        state2.message!,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                    );
                                    }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          dismissDirection: DismissDirection.horizontal,
                          content: Text(
                            "please make sure there is no error.",
                            style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text(
                  'Save password',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
          SizedBox(
            height: 20.h,
          )
        ]),
      ),
    );
  }
}
