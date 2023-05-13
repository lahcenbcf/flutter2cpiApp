import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:photo_view/photo_view.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({
    super.key,
    required this.image,
   required this.pathImage,
    required this.controllerTag,
  });
  final String controllerTag;
  final Uint8List? image;
  final String pathImage;

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
   late Future<File> fileImage;
   @override
   void initState() {
    // TODO: implement initState
    super.initState();
     fileImage=CorePostCotroller.uint8ListToFile(widget.image!,widget.pathImage);
   }

  @override
  Widget build(BuildContext context) {
    //
    final controller = Get.find<CorePostCotroller>(tag: widget.controllerTag);
    File imageFile;
    final size = MediaQuery.of(context).size;
  
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
     return FutureBuilder(future: fileImage
     ,builder: (context,snapShot){
       if(snapShot.hasData){
         imageFile=snapShot.data!;
        return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.only(left: 19.w),
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            child: Icon(
              FluentIcons.arrow_left_48_filled,
              size: 30 * iconSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body:widget.image!=null? PhotoView(
        imageProvider: FileImage(imageFile),
        //uint8ListToFile,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black54,
        ),
        heroAttributes: PhotoViewHeroAttributes(tag: widget.controllerTag),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained * 1,
        maxScale: PhotoViewComputedScale.covered * 1.5,
        basePosition: Alignment.center,
        filterQuality: FilterQuality.medium,
      ):null,
    );
      }
       else if(snapShot.hasError) {
           return Text('Error: ${snapShot.error}');
         } else {
           return const CircularProgressIndicator();
         }
       }
     );
    
   }

  }
