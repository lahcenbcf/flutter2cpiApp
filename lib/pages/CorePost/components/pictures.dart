import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pictures extends StatelessWidget {
  const Pictures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 190.h,
      decoration: BoxDecoration(
      color: Colors.red,
        borderRadius: BorderRadius.circular(15).r
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: FlutterLogo(),
      ),
    );
  }
}
