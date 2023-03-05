import 'dart:ui';
import 'package:flluter2cpi/components/guest/guestView/guestBox.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void afficherDialog(context) {
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
                    height: 480.h,
                    width: 371.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: const Color.fromARGB(31, 190, 187, 187)),
                      gradient: const LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[
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
                      FluentSystemIcons.ic_fluent_dismiss_circle_filled,
                      size: 50.0,
                    )),
              ),
            ],
          ),
        );
      });
}
