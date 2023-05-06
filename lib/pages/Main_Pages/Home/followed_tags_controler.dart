

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:get/get.dart';

class FollowedTagsController extends GetxController{
removeTag(int index){
  followedTags.removeAt(index);
  
}

}