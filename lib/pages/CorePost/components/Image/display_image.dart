import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
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
    Future<File> uint8ListToFile(Uint8List uint8list, String filePath) async {
    final file = File(filePath);
    await file.writeAsBytes(uint8list);
    return file;
}
    final size = MediaQuery.of(context).size;

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
        imageProvider: Image.memory(controller.image) as ImageProvider,
        //uint8ListToFile,
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
