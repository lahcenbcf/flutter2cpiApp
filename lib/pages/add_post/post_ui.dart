import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/module_content_1CS.dart';
// import 'package:flluter2cpi/Main_Pages/Esi_info/info_posts.dart';
// import 'package:flluter2cpi/Main_Pages/Esi_info/info_ui.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_ui.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Main_Pages/EsiFlow/esi_flow.dart';
import 'package:flluter2cpi/pages/Main_Pages/Esi_info/info_posts.dart';
import 'package:flluter2cpi/pages/add_post/post_view_mode.dart';
import 'package:flluter2cpi/pages/add_post/select_tag_ui.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Home_page/home_page_view.dart';
import '../../display_profile_pic.dart';
import '../Main_Pages/Esi_info/info_ui.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
File? imageFile;
String fname="";

  @override
  Widget build(BuildContext context) {
    if(userInfo != null){
  fname=userInfo![2];
}
    final state = Provider.of<Post_Model>(context);
    final AddPostState = Provider.of<Post_Model>(context,listen: false);
    print("selected index is $selectedIndex");
    Future takePhoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
          //state.pathImage=pickedFile.path;
          state.imageFile = imageFile;
        }
      });
    }

    Future choosephoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
          
         // state.pathImage=pickedFile.path;
          state.imageFile = imageFile;

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
        body: SingleChildScrollView(
            child: Consumer<Post_Model>(
                builder: (context, model, child) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 24.sp),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 250.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 27.sp),
                              child: TextButton( 
                                  style: const ButtonStyle( 
                                      backgroundColor: MaterialStatePropertyAll( 
                                          Color.fromRGBO(32, 197, 122, 1))), 
                                  onPressed: () {    context.read<Post_Model>().title; 
 
                                    if (model.get_title().length > 1) { 
                                      if (model.get_des().length > 1) { 
                                        Navigator.of(context) 
                                            .push(MaterialPageRoute( 
                                          builder: (context) => TagChooser(), 
                                        )); 
                                      } 
                                    } 
  },
                                  child: const Text(
                                    'Post',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 41.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const  DisplayProfilePic(22),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              fname!=""?  '$fname':"username",
                              style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: TextField(
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            controller: model.title,
                            decoration: const InputDecoration(
                                hintText: 'Title here',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 24, color: Colors.white)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.sp),
                          child: TextField(
                            style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            controller: model.description,
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                hintText: 'Write a caption ...',
                                border: InputBorder.none),
                            maxLines: 5,
                          ),
                        ),
                        Container(
                            decoration: const BoxDecoration(color: Colors.white),
                            child: SizedBox(
                              width: 330.w,
                              height: 4.h,
                            )),
                        SizedBox(
                          height: 60.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Container(
                            
                              width: 200.w,
                              decoration: BoxDecoration(
                             

                                border: Border.all(
                                    color: const Color.fromARGB(255, 102, 94, 94),
                                    width: 2.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                   TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: ((builder) => bottomSheet()),
                                        );
                                      },
                                      child: Text(
                                        '+ Add Picture',
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Center(
                                      child: state.imageFile == null
                                          ? const Text('No image selected')
                                          : Image.file(
                                              File(state.imageFile!.path),
                                              //File(state.pathImage),
                                              fit: BoxFit.contain,
                                            ),
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ))));
  }
}
