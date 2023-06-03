// import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/module_content.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flluter2cpi/display_profile_pic.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/add_post/post_view_mode.dart';
import 'package:flluter2cpi/pages/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home_page/home_page_view.dart';
import '../Main_Pages/Esi_info/info_ui.dart';
// import '../pages/Home_page/home_page_view.dart';

class TagChooser extends StatefulWidget {
  const TagChooser({super.key});

  @override
  State<TagChooser> createState() => _TagChooserState();
}

class _TagChooserState extends State<TagChooser> {
  List<List<ItemTag>> containerList = [
    [
      for (var x in originalETags) ItemTag(itemtext: x, click: true),
    ],
    [
      ItemTag(itemtext: 'Algebra 1', click: true),
      ItemTag(itemtext: 'Algebra 2', click: true),
      ItemTag(itemtext: 'Algebra 3', click: true),
      ItemTag(itemtext: 'Analysis 1', click: true),
      ItemTag(itemtext: 'Analysis 2', click: true),
      ItemTag(itemtext: 'Analysis 3', click: true),
      ItemTag(itemtext: 'Analysis 4', click: true),
      ItemTag(itemtext: 'Archi 1', click: true),
      ItemTag(itemtext: 'Archi 2', click: true),
      ItemTag(itemtext: 'ALSDS', click: true),
      ItemTag(itemtext: 'BWEB', click: true),
      ItemTag(itemtext: 'ELECT', click: true),
      ItemTag(itemtext: 'SYST1 (1CPI)', click: true),
      ItemTag(itemtext: 'TEE', click: true),
      ItemTag(itemtext: 'ALSDD', click: true),
      ItemTag(itemtext: 'ELECF 1', click: true),
      ItemTag(itemtext: 'English 1 ', click: true),
      ItemTag(itemtext: 'Mechanics', click: true),
      ItemTag(itemtext: 'SYST2 (1CPI)', click: true),
      ItemTag(itemtext: 'TEO', click: true),
      ItemTag(itemtext: 'Economie', click: true),
      ItemTag(itemtext: 'English 2', click: true),
      ItemTag(itemtext: 'SFSD', click: true),
      ItemTag(itemtext: 'Proba 1', click: true),
      ItemTag(itemtext: 'Proba 2', click: true),
      ItemTag(itemtext: 'ELECF 2', click: true),
      ItemTag(itemtext: 'ISI', click: true),
      ItemTag(itemtext: 'Logique', click: true),
      ItemTag(itemtext: 'English 3', click: true),
      ItemTag(itemtext: 'Optique', click: true),
      ItemTag(itemtext: 'POO', click: true),
      ItemTag(itemtext: 'SYST1 (1CS)', click: true),
      ItemTag(itemtext: 'Resaux 1', click: true),
      ItemTag(itemtext: 'IGL', click: true),
      ItemTag(itemtext: 'BDD', click: true),
      ItemTag(itemtext: 'Theorie des langages', click: true),
      ItemTag(itemtext: 'Analyse numerique', click: true),
      ItemTag(itemtext: 'RO', click: true),
      ItemTag(itemtext: 'Langue Anglaise 1', click: true),
      ItemTag(itemtext: 'SYST2 (1CS)', click: true),
      ItemTag(itemtext: 'Resaux 2', click: true),
      ItemTag(itemtext: 'Archi évoulué', click: true),
      ItemTag(itemtext: 'Analyse SI', click: true),
      ItemTag(itemtext: 'WEB', click: true),
      ItemTag(itemtext: 'Intro à la sécurité', click: true),
      ItemTag(itemtext: 'Gestion de projet', click: true),
      ItemTag(itemtext: 'Langue Anglaise 2', click: true),
    ],
    [
      ItemTag(itemtext: 'General', click: true),
      ItemTag(itemtext: 'Campus', click: true),
      ItemTag(itemtext: 'Administrative', click: true),
     

    ],[
       ItemTag(click: true, itemtext: "No tag for this post")
    ]
  ];

  @override
  Widget build(BuildContext context) {
    final AddPostState = Provider.of<Post_Model>(context, listen: false);

    //List<String> type = ['StuckPosts', 'academicPosts', 'infoPosts',''];
    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 24.sp),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 250.w,
                    ),
                    Consumer<Post_Model>( 
                builder: (context, model, child) =>
 Container(
                        padding: EdgeInsets.only(top: 24.sp),
                        child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(32, 197, 122, 1))),
                            onPressed: ()async {
                              await AddPostState.addPost(
                                AddPostState.get_title(),
                                AddPostState.get_des(),
                                //AddPostState.imageFile!,
                                // AddPostState.pathImage!,
                                
                                    selectedIndex == 1 
                                        ? "StuckPosts" 
                                        : selectedIndex == 2 
                                            ? "academicPosts" 
                                            : selectedIndex == 3 && 
                                                    selected_tab1 == 0 
                                                ? "articles" 
                                                : "infoPosts",context
                              );
                              
                              // ignore: use_build_context_synchronously
                              if (Navigator.of(context).canPop()) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              }
                              // ignore: use_build_context_synchronously
                              if (Navigator.of(context).canPop()) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              }
                              model.dispose_text();
                              
                            }, //here
                            child: const Text(
                              'Finish',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 41.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DisplayProfilePic(22),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '@username',
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                    width: 300.w,
                    alignment: Alignment.topLeft,
                    child: Text('Select Tag for your post  : ',
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))),
                MyGridView(containers: selectedIndex==3&&selected_tab1==0?containerList[3]: containerList[selectedIndex - 1]),
              ], //the selected index refer to the tab that
            ),
          ),
        ));
  }
}

class ItemTag extends StatefulWidget {
  ItemTag({super.key, required this.click, required this.itemtext});
  String itemtext;
  final bool click;
  String gettext() => itemtext;

  @override
  State<ItemTag> createState() => _ItemTagState();
}

class _ItemTagState extends State<ItemTag> {
  bool val = false;
  bool _isCheckboxSelected = false;

  void _onCheckboxChanged(bool value) {
    if (!_isCheckboxSelected) {
      setState(() {
        _isCheckboxSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AddPostState = Provider.of<Post_Model>(context, listen: false);
   
    return Row(
      children: [
        Consumer<TagModel>(
          builder: (context, model, child) => Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            child: Checkbox(
              activeColor: const Color.fromRGBO(32, 197, 122, 1),
              side: const BorderSide(
                  width: 1.0, color: Color.fromRGBO(32, 197, 122, 1)),
              value: val,
              onChanged: (bool? click) {
                setState(() {
                  val = click!;
                  if (val) {
                    model.text = widget.itemtext;
                    AddPostState.tag = model.text;
                    //geting the string value of the tag after checking the box
                    //print(widget.itemtext);
                    //model.addSelectedText(widget.itemtext);
                  }
                });
                // test if the table of strings is beig updated after cheking the box
              },
            ),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          widget.itemtext,
          style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    );
  }
}

class MyGridView extends StatelessWidget {
  final List<Widget> containers;

  const MyGridView({super.key, required this.containers});

  @override
  Widget build(BuildContext context) {
    print(containers.length);
    return GridView.builder(
      itemCount: containers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 0.1,
          childAspectRatio: 4.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return containers[index];
      },
    );
  }
}
