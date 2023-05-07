import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../second_cpi/module_ressources.dart';
import '../second_cpi/module_ressources.dart';
import '../module_posts.dart';

class Module_content_2CPI extends StatefulWidget {
  const Module_content_2CPI(
      {super.key, required this.title, required this.i});
  final String title;
  final int i;

  @override
  State<Module_content_2CPI> createState() => _Module_content_2CPIState();
}

List<List<String>> links1 = [
  [
    'https://drive.google.com/drive/folders/13sBrfzPYl7cWxcU_JDpP45CtQXxusnU4?usp=sharing&pli=1',
    'https://drive.google.com/drive/folders/18RQEKC5i-RD0XWBD8egGtzpzmbCs9pwX',
    'https://drive.google.com/drive/folders/15_TdcCXl-VGSySGE9V9zetOSlSFlN3SW',
    'https://drive.google.com/drive/folders/1aMrU0lxQ4og8BS9v-n21qK962bOgiaVm',
    'https://www.youtube.com/channel/UCz1ImVdblTGarFJnQDgAWNA',
    'https://www.youtube.com/c/Makemathseasier/playlists',
    'https://www.youtube.com/user/Exo7Math/playlists?view=50&sort=dd&shelf_id=7',
  ],
  [
    'https://drive.google.com/drive/folders/1dGbU14LEC68xPYJI-pc5UBZSOwiK8e8h?usp=sharing',
    'https://drive.google.com/drive/folders/1NhkpQ6MmZ3Ktvywat7iv7OE0JoKnklds',
    'https://drive.google.com/drive/folders/17lHVhNDME2aLjVyPXbWqk3ooZjdQt0w7',
    'https://drive.google.com/drive/folders/14WMJgb2rnc8tavIx8tPQMj8dXNKsLC3X',
    'https://www.youtube.com/c/PROFESSEURBENZINERACHIDMATHEMATIQUES/playlists',
    'https://www.youtube.com/c/MathsavecAmmar/playlists'
  ],
  [
    'https://drive.google.com/drive/folders/15bCBZK9mo3OVHKmJk06iw_eViAazy7LJ',
    'https://drive.google.com/drive/folders/1dTwcuAgnf_dCx-_GHVgsny2s83RfZOLB',
    'https://drive.google.com/drive/folders/1BwGYWkZ1UOubBmZVAsBUM6LG7QqHnDGx',
    'https://drive.google.com/drive/folders/1h5PtmpusWZKmXTPMp0FaZoBD1iZkrUZy'
  ],
  [
    'https://drive.google.com/drive/folders/1Ph5YKo2LBK9yu8LNpCt8O8juPinhXkmm?usp=sharing',
    'https://drive.google.com/drive/folders/1HAwIarDdpNdoTMtNqXOI0ywAAOe93qgh',
    'https://drive.google.com/drive/folders/1HAwIarDdpNdoTMtNqXOI0ywAAOe93qgh',
    'https://drive.google.com/drive/folders/1nOKC7FP50bfVp3C8MfI8whzUIwMw0dz7'
  ],
  [
    'https://drive.google.com/drive/folders/13nEVxVtvx8t9ClrWHb5iUTv2FA0bFLkj?usp=sharing',
    'https://drive.google.com/drive/folders/17VS-9o56Uz8_JTAX3O8h52WYzQpsH6Tq',
    'https://drive.google.com/drive/folders/17VS-9o56Uz8_JTAX3O8h52WYzQpsH6Tq',
    'https://drive.google.com/drive/folders/1V6BgsVWA9R46Q6WxYihXc2du9ax40vM7'
  ],
  [
    'https://drive.google.com/drive/folders/1ka45Tv6vE-sEd0Zw2f9J84CyPq_F7WYu?usp=sharing',
    'https://drive.google.com/drive/folders/1e6YPWQbLUFHaAaYszBLa1CA-no1k-mq1',
    'https://drive.google.com/drive/folders/1q1DO1_hp2YWtc3zo9M7OPrb1iD0EPBf3',
    'https://drive.google.com/drive/folders/18Z_URU8dnU2XWAf3hzkhxg9HnxVbIo30'
  ],
  [
    'https://drive.google.com/drive/folders/1IWOjQBM0eBMkH-9Gy11rQcZSMomQEega?usp=sharing',
    'https://drive.google.com/drive/folders/1o1EAPch1XbtD-odbRgKJs2BSJLL8Zo3G',
    'https://drive.google.com/drive/folders/1tWXVTtKF8J0bIYK_zWTPwtcmfD6WdgG_',
    'https://drive.google.com/drive/folders/1xhnlGgxAoXDv18i2Wv5R9GJvcnohOGMh'
  ],
  [
    'https://drive.google.com/drive/folders/1fha4zXPlDwQEt_uK_0KQnZ0YtDVcGkda?usp=sharing',
    'https://drive.google.com/drive/folders/1AROIgBetJ9ED0oiazW6-nmx2txKQYi3_',
    'https://drive.google.com/drive/folders/1Pg-eYCbeXRhLpS5tzZ_DRaX_JLx2Yh0X',
    'https://drive.google.com/drive/folders/1FMbLnv9tkFpvQfhwA4O3cJYlgwFxz9xw',
   
  ],
  [
    'https://drive.google.com/drive/folders/18OK1wi24FzSQuaOYwpUJVt5wenPeWKT1?usp=sharing',
    'https://drive.google.com/drive/folders/13UpX3eGGyuV8M_jRXJfmTYPvbS05Qjy0',
    'https://drive.google.com/drive/folders/19TRBMzaLKgl-bvEkrCQ_XH45cVeDrI5T',
    'https://drive.google.com/drive/folders/15snf3gvTNM3zW0uKqIM9tfYcLWpwTtCz',
    'https://www.youtube.com/c/PROFESSEURBENZINERACHIDMATHEMATIQUES/playlists'
  ],
  [
    'https://drive.google.com/drive/folders/19oI8MB8wCyf173lZE2aBzyNKAor1Q1u2?usp=sharing',
    'https://drive.google.com/drive/folders/1bTsywDA4IMZGEa9mM942ump_QPFneSDy',
    'https://drive.google.com/drive/folders/18b_DarEX1IgV4uyzzvKcB5qJqEytp8ES',
    'https://drive.google.com/drive/folders/1NupAzEOMhuBofwEZXGRkLQZ7AUPUKqnK'
  ],
  [
    'https://drive.google.com/drive/folders/1D4L4KXS3aZ_-ZkZCk7_nfE0X3gy0wPbq?usp=sharing',
    'https://drive.google.com/drive/folders/1rVzBvrkE-PX3Xallzkk5t9dHDmt9fS13',
    'https://drive.google.com/drive/folders/1bZtLR0DYIXxWShZQKyB3t96AF81tku33',
    'https://drive.google.com/drive/folders/1T0cEo0JqvqpDhU6hkUoUNQ8oRvehqRUQ'
  ],
  [
    'https://drive.google.com/drive/folders/1jQ2ARe-EaT3qmKDhDEKJU2oNxjLhtA-I?usp=sharing',
    'https://drive.google.com/drive/folders/1AfwVnPGGXmRfluGmxnEQBLK5UovUSL_N',
    'https://drive.google.com/drive/folders/1V6BgsVWA9R46Q6WxYihXc2du9ax40vM7',
    'https://drive.google.com/drive/folders/1V6BgsVWA9R46Q6WxYihXc2du9ax40vM7',
  ], //english 3
  [
    'https://drive.google.com/drive/folders/14PkJ7DPhRowa-ngNCC3D2ciEjPKv-ZZk?usp=sharing',
    'https://drive.google.com/drive/folders/187vVnz0sAh9T2KAXvCUy39uXxRHpW-ig',
    'https://drive.google.com/drive/folders/1NyaWsHeldsP3nurxwgm3Dmj41xJOUMkp',
    'https://drive.google.com/drive/folders/1pZpHeP4RrLYg0OyM511hj8RV2E0ieGbY'
  ],
  [
    'https://drive.google.com/drive/folders/1mIOlacQWhX9iC6Dp0kMWE1PLVxco1oto?usp=sharing',
    'https://drive.google.com/drive/folders/1GXiU-rP9tAr9A30syMg5Ze9SWA2ruv57',
    'https://drive.google.com/drive/folders/1vUd2BtTguhrLQOG2JxXVTyemG06km1BO',
    'https://drive.google.com/drive/folders/1JxF6v2-mevfdTx1aY-OGZus4s2r4wRwi'
  ],
  [
    'https://drive.google.com/drive/folders/1uU4MORfOXm3PcJrQ5BSIRWOjYMpDpQuL?usp=sharing',
    'https://drive.google.com/drive/folders/1VygJtlklwU9EmsvcxCX_i9Z2UtU8zwtY',
    'https://drive.google.com/drive/folders/15160ed2Jv6wYDVEegLa43iq3W3nUcNy0',
    'https://drive.google.com/drive/folders/1aaVBu6aqE-UFW5wjuYESzQ23bINpu44Q'
  ],
];
int selcted_tab = 0;

final List<List<Widget>> content = [
  [
    Module_posts('Algebra 3'),
    Module_ressources2(
        module: 'Algebra 3',
        url1: links1[0][0],
        url2: links1[0][1],
        url3: links1[0][2],
        url4: links1[0][3],
        url5: links1[0][4],
        url6: links1[0][5],
        chaine1: 'Mohcine EL miski',
        chaine2: 'Make math easier',
        chaine3: 'Exo 7'),
  ],
  [
    Module_posts('Analysis 3'),
    Module_ressources2(
      module: 'Analysis 3',
      url1: links1[1][0],
      url2: links1[1][1],
      url3: links1[1][2],
      url4: links1[1][3],
      url5: links1[1][4],
      chaine1: 'Benzine rachid',
      chaine2: 'math avec ammar',
    )
  ],
  [
    Module_posts('Archi 2'),
    Module_ressources2(
      module: 'Archi 2',
      url1: links1[2][0],
      url2: links1[2][1],
      url3: links1[2][2],
      url4: links1[2][3],
    )
  ],
  [
    Module_posts('Economie'),
    Module_ressources2(
      module: 'Economie',
      url1: links1[3][0],
      url2: links1[3][1],
      url3: links1[3][2],
      url4: links1[3][3],
    ),
  ],
  [
    Module_posts('English 2'),
    Module_ressources2(
      module: 'English 2',
      url1: links1[4][0],
      url2: links1[4][1],
      url3: links1[4][2],
      url4: links1[4][3],
    ),
  ],
  [
    Module_posts('ELECF2'),
    Module_ressources2(
      module: 'ELECF2',
      url1: links1[5][0],
      url2: links1[5][1],
      url3: links1[5][2],
      url4: links1[5][3],
    )
  ],
  [
    Module_posts('SFSD'),
    Module_ressources2(
      module: 'SFSD',
      url1: links1[6][0],
      url2: links1[6][1],
      url3: links1[6][2],
      url4: links1[6][3],
    ),
  ],
  [
    Module_posts('Proba 1'),
    Module_ressources2(
      module: 'Proba 1',
      url1: links1[7][0],
      url2: links1[7][1],
      url3: links1[7][2],
      url4: links1[7][3],
    ),
  ],
  [
    Module_posts('Analysis 4'),
    Module_ressources2(
      module: 'Analysis 4',
      url1: links1[8][0],
      url2: links1[8][1],
      url3: links1[8][2],
      url4: links1[8][3],
      
      chaine1: 'Benzine rachid',
    ),
  ],
  [
    Module_posts('ISI'),
    Module_ressources2(
      module: 'ISI',
      url1: links1[9][0],
      url2: links1[9][1],
      url3: links1[9][2],
      url4: links1[9][3],
    ),
  ],
  [
    Module_posts('Logique'),
    Module_ressources2(
      module: 'Logique',
      url1: links1[10][0],
      url2: links1[10][1],
      url3: links1[10][2],
      url4: links1[10][3],
    )
  ],
  [
    Module_posts('English 3'),
    Module_ressources2(
      module: 'English 3',
      url1: links1[11][0],
      url2: links1[11][1],
      url3: links1[11][2],
      url4: links1[11][3],
    )
  ],
  [
    Module_posts('Optique'),
    Module_ressources2(
      module: 'Optique',
      url1: links1[12][0],
      url2: links1[12][1],
      url3: links1[12][2],
      url4: links1[12][2],
    )
  ],
  [
    Module_posts('POO'),
    Module_ressources2(
      module: 'POO',
      url1: links1[13][0],
      url2: links1[13][1],
      url3: links1[13][2],
      url4: links1[13][3],
    )
  ],
  [
    Module_posts('Proba 2'),
    Module_ressources2(
      module: 'Proba 2',
      url1: links1[14][0],
      url2: links1[14][1],
      url3: links1[14][2],
      url4: links1[14][3],
    )
  ],
];

class _Module_content_2CPIState extends State<Module_content_2CPI> {
  on_tap_new(int selected) {
    setState(() {
      selcted_tab = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(35, 47, 56, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.h),
          child: AppBar(
              backgroundColor: Color.fromRGBO(35, 47, 56, 1),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              title: Text(
                widget.title,
                style: GoogleFonts.inter(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              centerTitle: true,
              bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.transparent,
                labelStyle: GoogleFonts.inter(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                onTap: (x) => on_tap_new(x),
                tabs: [
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, top: 1.h, bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: selcted_tab == 0
                            ? Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: Tab(
                        text: 'Questions',
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, top: 1.h, bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: selcted_tab == 1
                            ? Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: Tab(
                        text: 'Ressources',
                      ))
                ],
              )),
        ),
        body: content[widget.i][selcted_tab],
      ),
    );
  }
}
