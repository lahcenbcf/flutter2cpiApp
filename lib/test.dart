// ignore_for_file: prefer_const_literals_to_create_immutables
/*
import 'dart:io';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post-Info/Post_info_v.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
File? image;
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  File? image1;
  File? image2;
  File? image3;
  var picker = ImagePicker();
  getImage(int x) async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        switch (x) {
          case 0:
            image = File(pickedImage.path);
            break;
          case 1:
            image1 = File(pickedImage.path);
            break;
          case 2:
            image2 = File(pickedImage.path);
            break;
          default:
            image3 = File(pickedImage.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async{
              
             await getImage(0);
                ePosts.addAll(
                  [
                    
                    Post(
                      links: [],
                      image: image,
                      isBlack: false,
                      type: "stack",
                      likesCount: 0,
                      commentsCount: 0,
                      title: "younes ferthat is fucking habacha",
                      description:
                          "this is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d description",
                      date: DateTime.now(),
                      userName: "Aboubakr",
                      email: "la.belmi",
                      tag: originalETags[0],
                      comments: [],
                      isLiked: true,
                      controllerTag: "1",
                    ),
                    Post(
                      links: [],
                      image: image,
                      isBlack: false,
                      type: "stack",
                      likesCount: 1,
                      commentsCount: 2,
                      title: "python",
                      description:
                          "Python this is just d descriptionthis isjust d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d description",
                      date: DateTime.now(),
                      userName: "Aboubakr",
                      email: "la.belmi",
                      tag: originalETags[1],
                      comments: [],
                      isLiked: true,
                      controllerTag:"2",
                    ),
                    Post(
                      links: [],
                      image: image,
                      isBlack: false,
                      type: "stack",
                      likesCount: 3,
                      commentsCount: 3,
                      title: "younes ferthat is fucking habacha",
                      description:
                          "this is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d description",
                      date: DateTime.now(),
                      userName: "Aboubakr",
                      email: "la.belmi",
                      tag: originalETags[2],
                      comments: [],
                      isLiked: false,
                      controllerTag: "3",
                    ),
                   
                  ],
                );
              },
              child: const Text("add Post"),
            ),
          
          ],
        ),
      ),
    );
    
  }
}*/
