import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/module_content.dart';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


import '../pages/Home_page/home_page_view.dart';

class TagChooser extends StatefulWidget {
  const TagChooser({super.key});

  @override
  State<TagChooser> createState() => _TagChooserState();
  
}
class _TagChooserState extends State<TagChooser> {
  
  List<List<ItemTag>> containerList = [[ItemTag(itemtext: 'Pascal', click: true),
    ItemTag(itemtext: 'Jquery', click: true),
    ItemTag(itemtext: 'Linux', click: true),
    ItemTag(itemtext: 'Python', click: true),
    ItemTag(itemtext: 'CSS', click: true),
    ItemTag(itemtext: 'Ruby', click: true),
    ItemTag(itemtext: 'Java', click: true),
    ItemTag(
      itemtext: 'SQL',
      click: true
    ),
    ItemTag(itemtext: 'XML', click: true),
    ItemTag(itemtext: 'C#', click: true),
    ItemTag(itemtext: 'MySql', click: true),
    ItemTag(itemtext: 'Firebase', click: true),
    ItemTag(itemtext: 'C', click: true),
    ItemTag(
      itemtext: 'Node js',
      click: true,
    ),
    ItemTag(
      itemtext: 'HTML',
      click: true,
    ),
    ItemTag(
      itemtext: 'C ++',
      click: true,
    ),
    ItemTag(
      itemtext: 'React js',
      click: true,
    ),
    ItemTag(itemtext: 'Nest js', click: true),
    ItemTag(
      itemtext: 'Django',
      click: true,
    ),
    ItemTag(
      itemtext: 'Php',
      click: true,
    ),
    ItemTag(
      itemtext: '.net',
      click: true,
    ),
    ItemTag(
      itemtext: 'TypeScript',
      click: true,
    ),
    ItemTag(itemtext: 'JavaScript', click: true),
    ItemTag(
      itemtext: 'React native',
      click: true,
    ),
    ItemTag(
      itemtext: 'Android Studio',
      click: true,
    ),
    ],[ItemTag(itemtext: 'Algebra 1', click: true),
    ItemTag(itemtext: 'Algebra 2', click: true),
    ItemTag(itemtext: 'Algebra 3', click: true),
    ItemTag(itemtext: 'Analysis 1', click: true),
    ItemTag(itemtext: 'Analysis 2', click: true),
    ItemTag(itemtext: 'Analysis 3', click: true),
    ItemTag(itemtext: 'Analysis 4', click: true),
    ItemTag(
      itemtext: 'Archi 1',
      click: true
    ),
    ItemTag(itemtext: 'Archi 2', click: true),
    ItemTag(itemtext: 'ALSDS', click: true),
    ItemTag(itemtext: 'BWEB', click: true),
    ItemTag(itemtext: 'ELECT', click: true),
    ItemTag(itemtext: 'SYST1 (1CPI)', click: true),
    ItemTag(
      itemtext: 'TEE',
      click: true,
    ),
    ItemTag(
      itemtext: 'ALSDD',
      click: true,
    ),
    ItemTag(
      itemtext: 'ELECF 1',
      click: true,
    ),
    ItemTag(
      itemtext: 'English 1 ',
      click: true,
    ),
    ItemTag(itemtext: 'Mechanics', click: true),
    ItemTag(
      itemtext: 'SYST2 (1CPI)',
      click: true,
    ),
    ItemTag(
      itemtext: 'TEO',
      click: true,
    ),
    ItemTag(
      itemtext: 'Economie',
      click: true,
    ),
    ItemTag(
      itemtext: 'English 2',
      click: true,
    ),
    ItemTag(itemtext: 'SFSD', click: true),
    ItemTag(
      itemtext: 'Proba 1',
      click: true,
    ),
    ItemTag(
      itemtext: 'Proba 2',
      click: true,
    ),
    ItemTag(
      itemtext: 'ELECF 2',
      click: true,
    ),
    ItemTag(
      itemtext: 'ISI',
      click: true,
    ),
    ItemTag(
      itemtext: 'Logique',
      click: true,
    ),
    ItemTag(
      itemtext: 'English 3',
      click: true,
    ),
    ItemTag(
      itemtext: 'Optique',
      click: true,
    ),
    ItemTag(
      itemtext: 'POO',
      click: true,
    ) ,ItemTag(
      itemtext: 'SYST1 (1CS)',
      click: true,
    ),ItemTag(
      itemtext: 'Resaux 1',
      click: true,
    ),ItemTag(
      itemtext: 'IGL',
      click: true,
    ),ItemTag(
      itemtext: 'BDD',
      click: true,
    ),ItemTag(
      itemtext: 'Theorie des langages',
      click: true,
    ),ItemTag(
      itemtext: 'Analyse numerique',
      click: true,
    ),ItemTag(
      itemtext: 'RO',
      click: true,
    ),ItemTag(
      itemtext: 'Langue Anglaise 1',
      click: true,
    ),ItemTag(
      itemtext: 'SYST2 (1CS)',
      click: true,
    ),ItemTag(
      itemtext: 'Resaux 2',
      click: true,
    ),ItemTag(
      itemtext: 'Archi évoulué',
      click: true,
    ),ItemTag(
      itemtext: 'Analyse SI',
      click: true,
    ),ItemTag(
      itemtext: 'WEB',
      click: true,
    ),ItemTag(
      itemtext: 'Intro à la sécurité',
      click: true,
    ),ItemTag(
      itemtext: 'Gestion de projet',
      click: true,
    ),ItemTag(
      itemtext: 'Langue Anglaise 2',
      click: true,
    ),],[ ItemTag(
      itemtext: 'General',
      click: true,
    ),ItemTag(
      itemtext: 'Campus',
      click: true,
    ),ItemTag(
      itemtext: 'Administrative',
      click: true,
    ),]
    
  ];

  @override
  Widget build(BuildContext context) {
    final AddPostState=Provider.of<Post_Model>(context,listen: false);
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 47, 56, 1),
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
                    Container(
                      padding: EdgeInsets.only(top: 24.sp),
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(32, 197, 122, 1))),
                          onPressed: () async{
                            await AddPostState.addPost(AddPostState.get_title(), AddPostState.get_des(), AddPostState.imageFile!, AddPostState.pathImage,selectedIndex==2 ? "academicPosts" :"StuckPosts");
                          },//here
                          child: const Text(
                            'Finish',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 41.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1677741001200-79163963249d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60'),
                    ),
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
                Container(width: 300.w,alignment: Alignment.topLeft,child: Text('Select Tag for your post  : ',style: GoogleFonts.inter(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w400))),
                 MyGridView(containers: containerList[selectedIndex-1]),
                
              ],//the selected index refer to the tab that 
            ),
          ),
        ));
  }
}

class ItemTag extends StatefulWidget {
  ItemTag({super.key, required this.click, required this.itemtext});
  String itemtext;
  final bool click;
  String gettext()=>itemtext;

  @override
  State<ItemTag> createState() => _ItemTagState();
}

class _ItemTagState extends State<ItemTag> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    final AddPostState=Provider.of<Post_Model>(context,listen: false);
    return Row(
      children: [
        Consumer<TagModel>(builder: (context, model, child) => 
           Theme(
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
                      //model.text=widget.itemtext; 
                      AddPostState.tag=model.text;
                       //geting the string value of the tag after checking the box
                    //print(widget.itemtext);
                    //model.addSelectedText(widget.itemtext);

                    }});
                     // test if the table of strings is beig updated after cheking the box
                },),
                
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

  MyGridView({required this.containers});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
   
      itemCount: containers.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 0.1,
          childAspectRatio: 4.0),
      shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return containers[index];
      },
    );
  }
}


