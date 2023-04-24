import 'dart:convert';
import 'dart:typed_data';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

// ignore: camel_case_types
class Home_page_viewM extends ChangeNotifier {
  static List<dynamic>?stuckPosts;
  static void getAllposts(String username)async{
    Response response = await ApiServices.fetchAllPosts(username);
    String res = response.body;
    stuckPosts = jsonDecode(res);
    print(stuckPosts);
  }
}
