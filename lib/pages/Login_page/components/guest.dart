import 'dart:ui';
import 'package:flluter2cpi/pages/Login_page/components/guest_box_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDialogg(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 600.h,
                    width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: const Color.fromARGB(31, 190, 187, 187)),
                      gradient: const LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: [
                          Color(0x0a868686),
                          Color.fromARGB(251, 190, 189, 189),
                          Color(0x00868686)
                        ],
                        stops: <double>[0, 0.673, 1],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                  top: 120.0, right: 24.0, left: 24.0, child: GuestBox()),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      FluentIcons.dismiss_circle_48_filled,
                      size: 48,
                    )),
              ),
            ],
          ),
        );
      });
}
