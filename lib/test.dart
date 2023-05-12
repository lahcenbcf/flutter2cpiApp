// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/distinct_tags.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post-Info/Post_info_v.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  File? image;
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
              await  getImage(0);
               await getImage(1);
              await  getImage(2);
              await  getImage(3);
                articlePosts.addAll(
                  [
                    PostInfo(image: image, title: 'the first post ', description: 'this is just the discription', date: DateTime.now()),
                    PostInfo(image: image1, title: 'the first post ', description: 'this is just the discription', date: DateTime.now()),
                    PostInfo(image: image2, title: 'the first post ', description: 'this is just the discription', date: DateTime.now()),
                    PostInfo(image: image3, title: 'the first post ', description: 'this is just the discription', date: DateTime.now()),
                  
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
}
