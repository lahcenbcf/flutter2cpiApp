import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0).w,
          child: Column(
                mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0.h,
              ),
              const Shimmerr(width: 85, height: 22, radius: 0),
              SizedBox(
                height: 23.0.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < 6; i++)
                      const Shimmerr(width: 102, height: 40, radius: 10),
                  ],
                ),
              ),
              SizedBox(
                height: 31.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
              const Shimmerr(width: 145, height: 40, radius: 25),
              SizedBox(
                height: 13.0.h,
              ),
              Shimmerr(
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  radius: 0),
                  SizedBox(
                height: 16.0.h,
              ),
              const PostShimmer(),
                 SizedBox(
                height: 25.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Shimmerr extends StatelessWidget {
  const Shimmerr(
      {super.key,
      required this.width,
      required this.height,
      required this.radius});
  final double width;
  final double height;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5).w,
      child: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: const Color.fromRGBO(0, 0, 0, 0.8),
        highlightColor: const Color.fromRGBO(0, 0, 0, 0.5),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1],
              colors: [
                Color.fromRGBO(0, 0, 0, 0.73),
                Color.fromRGBO(30, 30, 30, 0.73),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.90);
    return LimitedBox(
      maxHeight: 250.h,
      child: PageView.builder(
        itemCount:4,
           
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5).w,
          child: Shimmer.fromColors(
            period: const Duration(seconds: 2),
            baseColor: const Color.fromRGBO(0, 0, 0, 0.8),
            highlightColor: const Color.fromRGBO(0, 0, 0, 0.5),
            child: Container(
              width: 360.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.73),
                    Color.fromRGBO(30, 30, 30, 0.73),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
