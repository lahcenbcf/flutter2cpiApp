import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flluter2cpi/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class Module_ressources extends StatelessWidget {
  

  Module_ressources({super.key, required this.module,required this.url1, required this.url2, required this.url3,this.url4,this.url5, this.url6,this.chaine1,this.chaine2,this.chaine3});
  final String module;
  final String url1;
  final String url2;
  final String url3;
  String? url4;
   String? url5;
   String? url6;
String? chaine1;
String? chaine2;
String? chaine3;


  @override
  Widget build(BuildContext context) { TextStyle kresources=GoogleFonts.inter(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.white);
    
    return Scaffold(backgroundColor: Color.fromRGBO(35, 47, 56, 1), body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top:20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Text('Ressources for $module',style:kresources),
          ],
        ),
      ),
      SizedBox(height: 47,),
      Row(children: [Image(image:AssetImage('lib/images/drive.png'),width: 30.w,height: 30.h,),SizedBox(width: 10.w,),Text('Google drives',style:kresources),SizedBox(height: 13.h,),
      ],),
      SizedBox(height: 20.h,),
      GestureDetector(
        onTap: () async {
         Uri uri=Uri.parse(url1) ;
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url1';
          }
            
          
        },child: Text('Esi_Sba_Drive',style: GoogleFonts.inter(fontSize: 18.sp,fontWeight: FontWeight.w300,color:Colors.white ),),),
       SizedBox(height: 20.h,),
        GestureDetector(
        onTap: () async {
         Uri uri=Uri.parse(url2) ;
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url2';
          }
            
          
        },child: Text('Esi_Alg_Drive',style: GoogleFonts.inter(fontSize: 18.sp,fontWeight: FontWeight.w300,color:Colors.white ),),),
        SizedBox(height: 20.h,),GestureDetector(
        onTap: () async {
         Uri uri=Uri.parse(url3) ;
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url3';
          }
            
          
        },child: Text('Estin_Bejaia_Drive',style: GoogleFonts.inter(fontSize: 18.sp,fontWeight: FontWeight.w300,color:Colors.white ),),),
      SizedBox(height: 11.h,),
      Row(children:[if(url4!=null&& url5!=null&&url6!=null)Image(image:AssetImage('lib/images/youtube.png'),height: 70.h,width: 70.w),SizedBox(width: 6.w,),if(url4!=null&& url5!=null&&url6!=null)Text('Youtube channels',style:kresources)
      
        ],),SizedBox(height: 20.h,),
     if(url4!=null) GestureDetector(
        onTap: () async {
          Uri uri=Uri.parse(url4!);
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url4';
          }
            
          
        },child: Text(chaine1!,style: GoogleFonts.inter(fontSize: 18.sp,fontWeight: FontWeight.w300,color:Colors.white ),),),SizedBox(height: 20.h,),
      if(url5!=null)GestureDetector(
        onTap: () async {
          Uri uri=Uri.parse(url5!);
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url5';
          }
            
          
        },child: Text(chaine2!,style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w300,color:Colors.white ),),),SizedBox(height: 20.h,),
      if(url6!=null)GestureDetector(
        onTap: () async {
          Uri uri=Uri.parse(url6!);
            if (await canLaunchUrl(uri)) {
           await launchUrl(uri);
          } else {
            throw 'Could not launch $url5';
          }
            
          
        },child: Text(chaine3!,style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w300,color:Colors.white ),),),
       ]),
      ),
    ));
  }
}