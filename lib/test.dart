import 'dart:io';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/comment_class.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/distinct_tags.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
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
    var picker = ImagePicker();
    getImage() async {
      var pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          image = File(pickedImage.path);
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
                await getImage();
                ePosts.insert(
                  0,
                  Post(
                    image: image,
                    type: "stack",
                    likesCount: 19,
                    commentsCount: 29,
                    title: "How to fix 'NoSuch MethodError' in Flutter app?",
                    description:
                        "I have a Flutter app that is crashing when I try to navigate to a new screen. The error message I'm getting is Navigator operation requested with a context that does not include a Navigator.I have tried searching for a solution online and came across some suggestions, such as wrapping the widget that triggers the navigation with a Builder widget or using a MaterialApp instead of a CupertinoApp. However, none of these solutions worked for me.I also tried checking if the issue is caused by any third-party packages that I'm using, but I couldn't find any conflicting packages or versions.I'm not sure what else to try or where to look for a solution. Can anyone help me understand what is causing this error and how to fix it? Thank you in advance.",
                    date: DateTime.now(),
                    userName: "Aboubakr",
                    email: "la.belmiloud",
                    tag: "flutter",
                    comments: [
                      CommentClass(
                          userName: "post 1 user name",
                          email: "b",
                          comment: "post 1 comment 1",
                          likesCount: 99,
                          commentsCount: 0,
                          date: DateTime.now().subtract(const Duration(days: 1)),
                          isLiked: true),
                      CommentClass(
                        userName: "user name",
                        email: "q",
                        comment: "post 1 comment 2",
                        likesCount: 10,
                        commentsCount: 190,
                        date: DateTime.now().subtract(const Duration(days: 2)),
                      ),
                    ],
                    isLiked: false,
                    controllerTag: generateTag(),
                  ),
                );
              },
              child: const Text("show dialog"),
            ),
            if(image != null) SizedBox(height: 190,width: 190,child: Image.file(File(image!.path))),
          ],
        ),
      ),
    );
  }
}
