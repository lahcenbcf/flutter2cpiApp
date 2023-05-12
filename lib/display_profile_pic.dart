import 'dart:io';

import 'package:flluter2cpi/test.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DisplayProfilePic extends StatelessWidget {
  const DisplayProfilePic(this.radius,{super.key});
final int radius;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    // remove this image variable and replace it with the profile pic of the user
    return image!= null? CircleAvatar(
      radius: radius*iconSize,
      backgroundImage: FileImage(
                File(image!.path),
             
              ),
            
          ): CircleAvatar(
      radius: radius * iconSize,
      backgroundColor: const Color.fromRGBO(39, 39, 39, 1),
      child: Icon(
        FluentIcons.person_24_filled,
        color: Colors.white,
        size: 32 * iconSize,
      ),
    );
  }
}
