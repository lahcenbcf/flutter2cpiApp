// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
File? image;
 var picker = ImagePicker();
  getImage(int x) async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      
        switch (x) {
          case 0:
            image = File(pickedImage.path);
            break;
        
        }
      
    }
  }
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  File? image1;
  File? image2;
  File? image3;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async{
              
            await getImage(0);
              },
              child: const Text("add Post"),
            ),
          
          ],
        ),
      ),
    );
  }
}
