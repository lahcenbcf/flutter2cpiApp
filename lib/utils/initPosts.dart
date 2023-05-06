import 'package:flluter2cpi/pages/Home_page/Home_page_viewM.dart';

class initPost{
  static void getStuckPost(String username){
    Home_page_viewM.getStuckPosts(username);
  }
  /*static Future getAcademicPosts(String username)async{
    await Home_page_viewM.getAcademicPosts(username);
  }*/
}