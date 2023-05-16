// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/pages/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/first_prepa_year.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../add_post/post_ui.dart';
import 'first_CS/first_cs_year.dart';
import 'first_cpi/first_prepa_year.dart';

class Academic_page extends StatefulWidget {
  const Academic_page({super.key});

  @override
  State<Academic_page> createState() => _Academic_pageState();
}
String url5='https://eloquent-kepler-b44278.netlify.app/';
 //the profile pic we must add

class _Academic_pageState extends State<Academic_page> {
  @override
  Widget build(BuildContext context) {
    var divider = const Divider(
      color: Color.fromRGBO(119, 119, 119, 1),
      indent: 10,
      endIndent: 10,
      height: 1,
    );
    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1677741001200-79163963249d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60'),
                  ),
                   const SizedBox(
                    width: 42,
                  ),
                  Column(
                    children: [
                      Text(
                        'Choose year',
                        style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Container(
                          color: const Color.fromRGBO(32, 197, 122, 1),
                          child: SizedBox(
                            width: 79.w,
                            height: 3.h,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Column(
              children: [
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>const First_prepa()));
                        },
                        child: Text(
                          '1CPI (First preparatory year)',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const First_prepa()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
SizedBox(height: 10.h,),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Second_prepa()));
                        },
                        child: Text('2CPI (Second preparatory year)',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Second_prepa()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const First_cs()));
                        },
                        child: Text('1CS (First Superior year)',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const First_cs()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: ()  async {
                    Uri uri = Uri.parse(url5);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $url5';
                    }
                  },
                        child: Text('2CS (Second Superior year)',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () 
                          async {
                    Uri uri = Uri.parse(url5);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $url5';
                    }
                  },
                        
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                divider,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () async {
                    Uri uri = Uri.parse(url5);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $url5';
                    }
                  },
                        child: Text('3CS (Third Superior year)',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () async {
                    Uri uri = Uri.parse(url5);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $url5';
                    }
                  },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromRGBO(32, 197, 122, 1))
                  ],
                )
              ],
            ),
          ],
        )),
        
        floatingActionButton: FloatingActionButton( shape: const CircleBorder(side: BorderSide()
           
     ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => const AddPostScreen()))),
          backgroundColor: const Color.fromRGBO(32, 197, 122, 1),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          
        ));
  }
}
