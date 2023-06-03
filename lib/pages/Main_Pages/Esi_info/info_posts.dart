// import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flluter2cpi/pages/Home_page/Home_page_viewM.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Home_page/home_page_view.dart';
import '../../Post-Info/post_info_v.dart';
import '../../add_post/post_ui.dart';

// import '../../add_post/post_ui.dart';
// import '../../pages/post-info/post-info.dart';

class Info_posts extends StatefulWidget {
  const Info_posts({super.key});

  @override
  State<Info_posts> createState() => _Info_postsState();
}

class _Info_postsState extends State<Info_posts> {
  late Future<List<PostInfo>> result;

  // @override
  // void initState(){
  //   super.initState();
  //   result=Home_page_viewM.fetchArtclePosts();
  // }
@override
initState(){
super.initState();
result=Home_page_viewM.fetchArtclePosts();
}
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(future: result,builder: (context,snapshot){
    //   if(snapshot.hasData){
    //     articlePosts=snapshot.data!;
    //     return Scaffold(
    //     backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
    //     body: articlePosts.isNotEmpty?ListView.separated(
    //       itemBuilder: (BuildContext context, int index)=>articlePosts[index],
    //       itemCount: articlePosts.length,
    //       separatorBuilder: (BuildContext context, int index) {
    //         return Divider(
    //           color: Colors.white,
    //           height: 3.h,
    //           thickness: 1,
    //           endIndent: 15.w,
    //           indent: 15.w,
    //         );
    //       },
    //     ):const Text("no posts yet"),
    //     floatingActionButton: FloatingActionButton(
    //       shape: const CircleBorder(side: BorderSide()),
    //       onPressed: () => Navigator.of(context)
    //           .push(MaterialPageRoute(builder: ((context) => const AddPostScreen()))),
    //       backgroundColor: const Color.fromRGBO(32, 197, 122, 1),
    //       child: const Icon(
    //         Icons.add,
    //         color: Colors.white,
    //       ),
    //     ));
    //   }else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else {
    //       return const CircularProgressIndicator();
    //     }
    // });

    // }
    final email=userInfo![3];
    return FutureBuilder(future: result,builder: (ctx,snapshot){
        if(snapshot.hasData){
          articlePosts=snapshot.data!;
          return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        body: articlePosts.isNotEmpty
            ? ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    PostInfo(image: articlePosts[index].image, title: articlePosts[index].title, description: articlePosts[index].description, date: articlePosts[index].date),
                itemCount: articlePosts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.white,
                    height: 3.h,
                    thickness: 1,
                    endIndent: 15.w,
                    indent: 15.w,
                  );
                },
              )
            : const Text("no posts yet"),
        floatingActionButton: isAdmin == (email=="h.bencharef@esi-sba.dz" || email=="la.belmiloud@esi-sba.dz" || email=="y.ferhat@esi-sba.dz" || email=="a.latrache@esi-sba.dz" || email=="a.lalliche@esi-sba.dz")
            ? FloatingActionButton( 
                shape: const CircleBorder(side: BorderSide()), 
                onPressed: () { 
                  Navigator.of(context).push(MaterialPageRoute( 
                      builder: ((context) => const AddPostScreen()))); 
                }, 
                backgroundColor: const Color.fromRGBO(32, 197, 122, 1), 
                child: const Icon( 
                  Icons.add, 
                  color: Colors.white, 
                )) 
            : null); 
        }else{
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 0.2,
          ),
          ) ;
        }
    });
    /*
    return Fu
    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        body: articlePosts.isNotEmpty
            ? ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                    PostInfo(image: articlePosts[index].image, title: articlePosts[index].title, description: articlePosts[index].description, date: articlePosts[index].date),
                itemCount: articlePosts.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.white,
                    height: 3.h,
                    thickness: 1,
                    endIndent: 15.w,
                    indent: 15.w,
                  );
                },
              )
            : const Text("no posts yet"),
        floatingActionButton: isAdmin == (email=="h.bencharef@esi-sba.dz" || email=="la.belmiloud@esi-sba.dz" || email=="y.ferhat@esi-sba.dz" || email=="a.latrache@esi-sba.dz" || email=="a.lalliche@esi-sba.dz")
            ? FloatingActionButton( 
                shape: const CircleBorder(side: BorderSide()), 
                onPressed: () { 
                  Navigator.of(context).push(MaterialPageRoute( 
                      builder: ((context) => const AddPostScreen()))); 
                }, 
                backgroundColor: const Color.fromRGBO(32, 197, 122, 1), 
                child: const Icon( 
                  Icons.add, 
                  color: Colors.white, 
                )) 
            : null);*/
  }
}
