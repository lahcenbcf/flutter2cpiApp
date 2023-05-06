import 'dart:io';

import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Imagee extends StatelessWidget {
  const Imagee({
    super.key,
    required this.controllerTag,
  });
  final String controllerTag;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CorePostCotroller>(tag: controllerTag);
    return Container(
      width: double.maxFinite,
      height: 190.h,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Hero(
        tag: controllerTag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Image.file(
            File(controller.image!.path),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
