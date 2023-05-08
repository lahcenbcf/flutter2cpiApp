// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flluter2cpi/pages/Post-Info/Post_info_v.dart';

import '../Post/post_v.dart';
import 'distinct_tags.dart';

List<Post> ePosts = [ 
];
List<Post> aPosts = [
  Post(
    isBlack: true,
    type: "academic",
    likesCount: 1,
    reportCounts: 0,
    isReported: false,
    pathImage: "",
    commentsCount: 99,
    title: "younes ferthat is fucking habacha",
    description:
        "this is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d descriptionthis is just d description",
    FormattedDate: "",
    userName: "Aboubakr",
    email: "la.belmi",
    tag: "flutter",
    comments: [],
    isLiked: true,
    controllerTag: generateTag(),
  ),
  Post(
    isBlack: true,
    pathImage: "",
    isReported: false,
    type: "academic",
    reportCounts: 0,
    likesCount: 2,
    commentsCount: 3,
    title: "younes ferthat is fucking habacha",
    description: "this is just d description",
    FormattedDate:"2023-06-23",
    userName: "Aboubakr",
    email: "la.belmi",
    tag: "flutter",
    comments: [],
    isLiked: true,
    controllerTag: generateTag(),
  ),
  Post(
    isBlack: true,
    pathImage: "",
    type: "academic",
    reportCounts: 0,
    likesCount: 2,
    commentsCount: 3,
    title: "younes ferthat is fucking habacha",
    description: "this is just d description",
    FormattedDate: "2020",
    userName: "Aboubakr",
    email: "la.belmi",
    isReported: false,
    tag: "flutter",
    comments: [],
    isLiked: true,
    controllerTag: generateTag(),
  ),
];
List<PostInfo> iPosts = [
  PostInfo(
      image: null,
      title: "this is post info",
      description: "and this is the descriptio",
      date: DateTime.now()),
  PostInfo(
      image: null,
      title: "this is post info",
      description: "and this is the descriptio",
      date: DateTime.now()),
  PostInfo(
      image: null,
      title: "this is post info",
      description: "and this is the descriptio",
      date: DateTime.now()),
];
List<String> followedTags = [
  
];
List<String> originalETags =["javascript", "python", "java", "c#", "php", "android", "html", "jquery", "c++", "css", "ios", "sql", "mysql", "r", "node.js", "reactjs", "arrays", "c","asp.net", "json",
"python-3.x", "ruby-on-rails", ".net", "sql-server", "swift", "django", "angular", "objective-c", "pandas", "excel", "angularjs", "regex", "ruby", "linux", "ajax",      
"iphone", "typescript", "xml", "vba", "spring", "laravel", "asp.net-mvc", "database", "wordpress", "string", "mongodb", "postgresql", "wpf", "windows", "flutter", "xcode",
"bash", "amazon-web-services", "oracle", "git", "dataframe", "firebase", "list", "vb.net", "spring-boot", "multithreading", "azure", "react-native", "docker",       
"eclipse", "algorithm", "macos", "visual-studio", "image", "forms", "powershell", "scala", "numpy", "function", "api", "vue.js", "twitter-bootstrap", "selenium",      
"performance","winforms", "python-2.7", "loops", "matlab","hibernate", "sqlite", "express", "apache", "rest", "shell", "entity-framework", "android-studio", "csv",  
"kotlin", "dart", "maven", "linq", "facebook", "qt", "dictionary", "unit-testing"]; 
List<String> eTags = [
  "javascript", "python", "java", "c#", "php", "android", "html", "jquery", "c++", "css", "ios", "sql", "mysql", "r", "node.js", "reactjs", "arrays", "c","asp.net", "json",
"python-3.x", "ruby-on-rails", ".net", "sql-server", "swift", "django", "angular", "objective-c", "pandas", "excel", "angularjs", "regex", "ruby", "linux", "ajax",      
"iphone", "typescript", "xml", "vba", "spring", "laravel", "asp.net-mvc", "database", "wordpress", "string", "mongodb", "postgresql", "wpf", "windows", "flutter", "xcode",
"bash", "amazon-web-services", "oracle", "git", "dataframe", "firebase", "list", "vb.net", "spring-boot", "multithreading", "azure", "react-native", "docker",       
"eclipse", "algorithm", "macos", "visual-studio", "image", "forms", "powershell", "scala", "numpy", "function", "api", "vue.js", "twitter-bootstrap", "selenium",      
"performance","winforms", "python-2.7", "loops", "matlab","hibernate", "sqlite", "express", "apache", "rest", "shell", "entity-framework", "android-studio", "csv",  
"kotlin", "dart", "maven", "linq", "facebook", "qt", "dictionary", "unit-testing"
];

