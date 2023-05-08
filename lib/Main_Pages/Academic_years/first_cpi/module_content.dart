import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flluter2cpi/constants.dart';

import 'module_ressources.dart';

class Module_content extends StatefulWidget {
  // add the list of posts and the list of url (with package)to the parameter of the constructor
   const Module_content({super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  State<Module_content> createState() => _Module_contentState();
}

List<List<String>> links = [
  [
    'https://drive.google.com/drive/folders/1gYPw7KX5OKzY6D_ap6jIbwtBW2ylI1qA',
    'https://drive.google.com/drive/folders/1-GLhIpVHhcTuExduxpzEIYiCBomHfcTm',
    'https://drive.google.com/drive/folders/1NACYYX7czecJ7WggKtEbWA7-79A4EWqC',
    'https://www.youtube.com/watch?v=m5uBNZ9Zg7E&list=PLtjcRp9Ftqb32kUDyKwhEKZw_7WWI3Byq&ab_channel=AsmaKf',
    'https://www.youtube.com/channel/UC0BdvB3lRLsO0sQlHGiHUDA',
    'https://www.youtube.com/channel/UCSwIvtC-82v-DecJM7A7aWw'
  ],
  [
    'https://drive.google.com/drive/folders/1JMdHtBTNN9kn3bzPxfFID_eCT3W3kFve',
    'https://drive.google.com/drive/folders/18mRIslBoENB357YZ2CR72a5SGNPFIDdP',
    'https://drive.google.com/drive/folders/1Qlnjf_sseCIruPc6bpqSqFgjJ7JPkFa7',
    'https://www.youtube.com/c/AlgoProgrammation1%C3%A8reAnn%C3%A9eTechnologie/videos',
    'https://www.youtube.com/c/hassanbahi/featured',
    'https://www.youtube.com/playlist?list=PL2aehqZh72Lumvy4tSekr6Rzcgwn15MLI'
  ],
  [
    'https://drive.google.com/drive/folders/1iZuR38HOX3p8As-tAZv4fBJ0QprruHfK',
    'https://drive.google.com/drive/folders/1Wa9Vm1UpIGYEf4Q9umWn_1pJRae1Au2a',
    'https://drive.google.com/drive/folders/14xOwnCCt3ezZgzo0XLWEIl8Icwmu9NuU',
    'https://www.youtube.com/watch?v=zAjtkY75tn0&list=PLtjcRp9Ftqb3iYpKfEnfToMBOqlzgS-o_&ab_channel=AsmaKf',
    'https://www.youtube.com/channel/UCSwIvtC-82v-DecJM7A7aWw',
    'https://www.youtube.com/channel/UCz1ImVdblTGarFJnQDgAWNA'
  ],
  [
    'https://drive.google.com/drive/folders/12jZLzde7lEnbDmhWa5bO2pqT9O0B0nrZ',
    'https://drive.google.com/drive/folders/1roZVYIsqBbWn6z12WvKk9QOVc6ujjFZ7',
    'https://drive.google.com/drive/folders/1Wsovk_Unv--YndAElXkshwClXEnGsU6R',
    'https://www.youtube.com/channel/UCVg0mKFnFkhZghEj-DS853Q',
    'https://www.youtube.com/c/NeroAcademy/playlists'
  ],
  [
    'https://drive.google.com/drive/folders/1-hfGDNLTYLdo09JZDBzddlCXvrswQoqH',
    'https://drive.google.com/drive/folders/1l-jS08QcpJ59rFKQuT6t_lTvyRcZpyLP',
    'https://drive.google.com/drive/folders/1j-hoafEc81zNf5M1ZCjpgYU2uTMvavrW',
    'https://www.youtube.com/watch?v=VhmkLrOjLsw',
    'https://www.youtube.com/watch?v=916GWv2Qs08&ab_channel=freeCodeCamp.org'
  ],
  [
    'https://drive.google.com/drive/folders/1uYtJSesGf9iLIdlO98gMcng8JgL5nVoh',
    'https://drive.google.com/drive/folders/1XPup9-12UAQaL_Srvs8YXLyCz_GAoSy7',
    'https://drive.google.com/drive/folders/1PQZUS5uoPMhuz2thEoKH69dDYhW0VemI',
    'https://www.youtube.com/watch?v=QerVS5dAXIM&list=PL9niwmraVUM542ucj12FiGZLZaXlOFuuo&ab_channel=MohssineElMiski',
    'https://www.youtube.com/channel/UC7-bLixzn4CA2r3oYT2wihg/playlists',
    'https://www.youtube.com/c/exomaroc/playlists'
  ],
  [
    'https://drive.google.com/drive/folders/1_gcj3jeYxvQYUFiiCQsPO6w7kh0H2p-k',
    'https://drive.google.com/drive/folders/1sCrT3ZboTghkAQoeKY-MuBw18jOgoe9P',
    'https://drive.google.com/drive/folders/15NkhBX3gzV9-wJuxexLrCoFr2JYjUuyw',
    'https://www.youtube.com/playlist?list=PLu8dLWf5G2NL0yC6B9hxV2nKHSAnjrtVf',
    'https://www.youtube.com/playlist?list=PLT98CRl2KxKHaKA9-4_I38sLzK134p4GJ'
  ],
  [
    'https://drive.google.com/drive/folders/1DMliwxMatroivYIeDimmvwM9H5dEgmul',
    'https://drive.google.com/drive/folders/14YF8rXZIzN7RMiv6Q15e7LBaCGSoLZC1',
    'https://drive.google.com/drive/folders/1TOaRSlR4-4y6N-ALFHB-RcFDqIJWlcA5'
  ],
  ['https://drive.google.com/drive/folders/1rFYCLBBUDXeDLQMN3xmdBnE7d80YlT0S','https://drive.google.com/drive/folders/1f2gOavd8LJ_nE9TgM_3eeFkC18TVe0Z2','https://drive.google.com/drive/folders/1k-L42I4mW641G-gCv1OkkmfHaAy0YvSv','https://www.youtube.com/playlist?list=PLtjcRp9Ftqb2_gVbbPIHiT21NSyAX28x5','https://www.youtube.com/c/15MinMathLr2020/videos','https://www.youtube.com/playlist?list=PL9niwmraVUM4jLKzm1YoAxs3xkS13gPgJ'],
  ['https://drive.google.com/drive/folders/1JqQnxkdFrF9lGpX6lhdHvAzQ1uPFbPMH','https://drive.google.com/drive/folders/1GRsxxfaoTttMZDJKpXiQP7fSNhtTO6p8','https://drive.google.com/drive/folders/1z9_Omgv4g2urfRkpytxTPlr9agFPAJ34','https://www.youtube.com/playlist?list=PLwHHAvorm5F810WPa84exJQEmm6F5SxCT','https://www.youtube.com/watch?v=rHxmE9Kjm9c&list=PLn3XTgvZWCiwdekMSYmLswi9HpvwpypGU&ab_channel=USTHB-Lic2ACAD','https://www.youtube.com/channel/UC1G7VhaiY_e4CT6wTOP_1Jg/playlists'],
  ['https://drive.google.com/drive/folders/1H1AovChhsN-E_ZtuOOUXfxbIMGSvo2MA','https://drive.google.com/drive/folders/1GdoGSyCotwwX-8dFOvFG97d-nUipBbKG','https://drive.google.com/drive/folders/1FcBF1PGB98QZ4fvUR1AvWI5RuxTzX84e','https://www.youtube.com/c/15MinMathLr2020/playlists','https://www.youtube.com/playlist?list=PL9niwmraVUM4LPlPE7RJ-8eKoZZAuNUgX','https://www.youtube.com/channel/UCKBL6697Yy5PulQrOmLJZwg/playlists'],
  ['https://drive.google.com/drive/folders/163c8Pv4GUDhns5Hd6oJfuG-A7dLwEyEN','https://drive.google.com/drive/folders/1-3-sYQMCWBHPagdCxFI-vA7E73FxXUI5','https://drive.google.com/drive/folders/1ouMD02IIIA63p0BIMSEEIv5Z_kPbs54w'],
  ['https://drive.google.com/drive/folders/1MZCcG2A60QLcO7Z2zveY8uWlFNKt6r32','https://drive.google.com/drive/folders/1WkIDTa8DW9mUcUa812JbuDrdkvqp5lQV','https://drive.google.com/drive/folders/1WYTwbBDPLB9VcyKDFgTPiZJtDcvRAL4H'],
  ['https://drive.google.com/drive/folders/1hYmTRPFI19bPx8NiXyIqBLvTCkWlFAEK','https://drive.google.com/drive/folders/1ybGMt4utc9zho3vuUNzLPwJdPiU6p-JA','https://drive.google.com/drive/folders/1UpAYEP3YxSeWVT9xy67kYKBjtcReb-eT','https://www.youtube.com/channel/UCM3iKe5l5TQjWdJsT4gv7Lw/playlists','https://www.youtube.com/playlist?list=PL9niwmraVUM5jA-yLuCkq2wrMCn32-G4Z'],
  ['https://drive.google.com/drive/folders/17heSpEyjLuOaS9epHIZfb5tbIk5n3pz-','https://drive.google.com/drive/folders/17heSpEyjLuOaS9epHIZfb5tbIk5n3pz-','https://drive.google.com/drive/folders/17heSpEyjLuOaS9epHIZfb5tbIk5n3pz-',],
  ['https://drive.google.com/drive/folders/1FDFZEUG4W58xl0oUwiAJRb-_ypgxQgUE','https://drive.google.com/drive/folders/1V9N--WkxJFiXBSq1nAQUBPDL1OF1wQac','https://drive.google.com/drive/folders/1TOaRSlR4-4y6N-ALFHB-RcFDqIJWlcA5']
];
int selcted_tab = 0;
final List<List<Widget>> content = [[
  Module_posts('Algebra 1'),
  Module_ressources(
      module: 'Algebra 1',
      url1: links[0][0],
      url2: links[0][1],
      url3: links[0][2],
      url4: links[0][3],
      url5: links[0][4],
      url6: links[0][5],
      chaine1: 'Asma Kf Channel',
      chaine2: '15 min math Lr',
      chaine3: 'Amin Attailki'),],
  [Module_posts('ALSDS'),
  Module_ressources(
    module: 'ALSDS',
    url1: links[1][0],
    url2: links[1][1],
    url3: links[1][2],
    url4: links[1][3],
    url5: links[1][4],
    url6: links[1][5],
    chaine1: 'Algo programation',
    chaine2: 'Hssan EL Bahi',
    chaine3: 'Mohamed Karam',
  )],
 [ Module_posts('Anaylsis 1'),
  Module_ressources(
    module: 'Anaylsis 1',
    url1: links[2][0],
    url2: links[2][1],
    url3: links[2][2],
    url4: links[2][3],
    url5: links[2][4],
    url6: links[2][5],
    chaine1: 'Asma Kf Channel',
    chaine2: '15 min math Lr',
    chaine3: 'Mohcine EL Miski',
  )],
 [ Module_posts('Archi'),
  Module_ressources(
    module: 'Archi',
    url1: links[3][0],
    url2: links[3][1],
    url3: links[3][2],
    url4: links[3][3],
    url5: links[3][4],
    chaine1: 'cours Mahseur',
    chaine2: 'Neso Acadamey',
  ),],
 [ Module_posts('BWEB'),
  Module_ressources(
    module: 'BWEB',
    url1: links[4][0],
    url2: links[4][1],
    url3: links[4][2],
    url4: links[4][3],
    url5: links[4][4],
    chaine1: 'LaTex Crash Course',
    chaine2: 'HTML Crash Course',
  ),],
 [ Module_posts('ELECT'),
  Module_ressources(
      module: 'ELECT',
      url1: links[5][0],
      url2: links[5][1],
      url3: links[5][2],
      url4: links[5][3],
      url5: links[5][4],
      url6: links[5][5],
      chaine1: 'Mohcine El Miski',
      chaine2: 'Prof de Pc ISSAM',
      chaine3: 'exo maroc'),],
  [Module_posts('SYST1'),
  Module_ressources(
    module: 'SYST1',
    url1: links[6][0],
    url2: links[6][1],
    url3: links[6][2],
    url4: links[6][3],
    url5: links[6][4],
    chaine1: 'IT courses',
    chaine2: 'Learn Linux',
  ),],
  [Module_posts('TEE'),
  Module_ressources(
    module: 'TEE',
    url1: links[7][0],
    url2: links[7][1],
    url3: links[7][2],
  ),],
  [Module_posts('Algebra 2'),
  Module_ressources(
    module: 'Algebra 2',
    url1: links[8][0],
    url2: links[8][1],
    url3: links[8][2],
    url4:links[8][3] ,
    url5: links[8][4],
    url6: links[8][5],
    chaine1: 'Asma Kf Channel',
    chaine2: '15 min math Lr',
    chaine3: 'Mohcine EL Miski',
  ),],
  [Module_posts('ALSDD'),
  Module_ressources(
    module: 'ALSDD',
    url1: links[9][0],
    url2: links[9][1],
    url3: links[9][2],
    url4: links[9][3] ,
    url5: links[9][4],
    url6: links[9][5],
    chaine1: 'Algo programation',
    chaine2: 'USTHB',
    chaine3: 'Math Info Dz',
  ),],
 [Module_posts('Analysis 2'),
  Module_ressources(
    module: 'Analysis 2',
    url1: links[10][0],
    url2: links[10][1],
    url3: links[10][2],
    url4: links[10][3] ,
    url5: links[10][4],
    url6: links[10][5],
    chaine1: '15 min math Lr',
    chaine2: 'Mohcine EL Miski',
    chaine3: 'math-physique with oukerimi',
  )]
  ,
 [Module_posts('ELECF1'),
  Module_ressources(
    module: 'ELECF1',
    url1: links[11][0],
    url2: links[11][1],
    url3: links[11][2],
   
  )],
 [ Module_posts('English 1'),
  Module_ressources(
    module: 'English 1',
    url1: links[12][0],
    url2: links[12][1],
    url3: links[12][2],
   
  )],
  
[ Module_posts('Mechanics'),
  Module_ressources(
    module: 'Mechanics',
    url1: links[13][0],
    url2: links[13][1],
    url3: links[13][2],
    url4: links[13][3] ,
    url5: links[13][4],

    chaine1: 'Berbiche',
    chaine2: 'Mohcine EL Miski',
   
  )]
  ,
 [ Module_posts('SYST 2'),
  Module_ressources(
    module: 'SYST 2',
    url1: links[14][0],
    url2: links[14][1],
    url3: links[14][2],
   
  )]
   ,
  [Module_posts('TEO'),
  Module_ressources(
    module: 'TEO',
    url1: links[15][0],
    url2: links[15][1],
    url3: links[15][2],
   
  )]
  
];

class _Module_contentState extends State<Module_content> {
  @override
  Widget build(BuildContext context) {
    on_tap_new(int selected) {
      setState(() {
        selcted_tab = selected;
      });
    }

    
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
        body: content[widget.index][selcted_tab],
      ),
    );
  }
}
