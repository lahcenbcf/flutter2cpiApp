import 'dart:convert';

import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:flluter2cpi/test.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:photo_view/photo_view.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    super.key,
    required this.controllerTag,
  });
  final String controllerTag;
  @override
  Widget build(BuildContext context) {
    //
    final controller = Get.find<CorePostCotroller>(tag: controllerTag);

    final size = MediaQuery.of(context).size;
    /*ImageProvider imageProvider;
    if(controller.image !=""){
      imageProvider=MemoryImage(base64.decode(controller.image!));
    }else{
      imageProvider=NetworkImage("https://images.unsplash.com/photo-1560169573-5ff6f7f35fe4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=940&q=80");
    }*/
    
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
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
      body: PhotoView(
        imageProvider: MemoryImage(base64.decode(controller.image!)),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black54,
        ),
        heroAttributes: PhotoViewHeroAttributes(tag: controllerTag),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained * 1,
        maxScale: PhotoViewComputedScale.covered * 1.5,
        basePosition: Alignment.center,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}
