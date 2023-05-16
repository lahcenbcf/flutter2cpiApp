// import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module_posts.dart';
import 'module_ressources_1CS.dart';

class Module_content_1CS extends StatefulWidget {
  const Module_content_1CS({super.key, required this.title, required this.i});
  final String title;
  final int i;
  @override
  State<Module_content_1CS> createState() => _Module_content_1CSState();
}

List<List<String>> linksCS = [
  ['https://www.google.com/'],
  ['https://www.google.com/'],
  ['https://www.google.com'],
  ['https://www.google.com/'],
  ['https://www.google.com/'],
  ['https://www.google.com/'],
  ['https://www.google.com/'],
  ['https://www.google.com/'],
  [
    'https://drive.google.com/drive/folders/148URolWyEtwZ9tPb1yhr670wJISKXHJf?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1KUzPZu5MDpG3wEJ7qaYggY64egOXEEmR?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1KUzPZu5MDpG3wEJ7qaYggY64egOXEEmR?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1OgeD75cPfTW8NSlG22XvcCGK6mAvauGD?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/18d1UlW1LLTN8FlE0zT7TXwAkDI3lGzjY?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1HNZXL6VOUYBFF7EhfpWti6WNqc5c0RVv?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1JLMKTk4wyMXRJvULjmvrncuDzxqeeDeW?usp=sharing'
  ],
  [
    'https://drive.google.com/drive/folders/1clTvQu-ZOuwmT_Xt7QXG8T4zqq1CPM1E?usp=sharing'
  ]
];
final List<List<Widget>> content = [
  [
    const Module_posts('SYST1 (1CS)'),
    Module_ressources_1CS(
      module: 'SYST1 (1CS)',
      url1: linksCS[0][0],
    )
  ],
  [
    const Module_posts('Resaux 1'),
    Module_ressources_1CS(
      module: 'Resaux 1',
      url1: linksCS[1][0],
    )
  ],
  [
    const Module_posts('IGL'),
    Module_ressources_1CS(
      module: 'IGL',
      url1: linksCS[2][0],
    )
  ],
  [
    const Module_posts('BDD'),
    Module_ressources_1CS(
      module: 'BDD',
      url1: linksCS[3][0],
    )
  ],
  [
    const Module_posts('Theeorie des langages'),
    Module_ressources_1CS(
      module: 'Theeorie des langages',
      url1: linksCS[4][0],
    )
  ],
  [
    const Module_posts('Analyse numerique'),
    Module_ressources_1CS(
      module: 'Analyse numerique',
      url1: linksCS[5][0],
    )
  ],
  [
    const Module_posts('RO'),
    Module_ressources_1CS(
      module: 'RO',
      url1: linksCS[6][0],
    )
  ],
  [
    const Module_posts('Langue Anglaise 1'),
    Module_ressources_1CS(
      module: 'Langue Anglaise 1',
      url1: linksCS[7][0],
    )
  ],
  [
    const Module_posts('SYST2 (1CS)'),
    Module_ressources_1CS(
      module: 'SYST2 (1CS)',
      url1: linksCS[8][0],
    )
  ],
  [
    const Module_posts('Resaux 2'),
    Module_ressources_1CS(
      module: 'Resaux 2',
      url1: linksCS[9][0],
    )
  ],
  [
    const Module_posts('Archi évoulué'),
    Module_ressources_1CS(
      module: 'Archi évoulué',
      url1: linksCS[10][0],
    )
  ],
  [
    const Module_posts('Analyse SI'),
    Module_ressources_1CS(
      module: 'Analyse SI',
      url1: linksCS[11][0],
    )
  ],
  [
    const Module_posts('WEB'),
    Module_ressources_1CS(
      module: 'WEB',
      url1: linksCS[12][0],
    )
  ],
  [
    const Module_posts('Intro à la sécurité'),
    Module_ressources_1CS(
      module: 'Intro à la sécurité',
      url1: linksCS[13][0],
    )
  ],
  [
    const Module_posts('Gestion de projet'),
    Module_ressources_1CS(
      module: 'Gestion de projet',
      url1: linksCS[14][0],
    )
  ],
  [
    const Module_posts('Langue Anglaise 2'),
    Module_ressources_1CS(
      module: 'Langue Anglaise 2',
      url1: linksCS[15][0],
    )
  ]
];
int selcted_tab = 0;

class _Module_content_1CSState extends State<Module_content_1CS> {
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
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.h),
          child: AppBar(
              backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
              leading: IconButton(
                  icon: const Icon(
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
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: const Tab(
                        text: 'Questions',
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, top: 1.h, bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: selcted_tab == 1
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: const Tab(
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
