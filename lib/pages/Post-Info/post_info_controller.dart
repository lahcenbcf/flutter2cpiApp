import 'dart:io';

import 'package:get/get.dart';

class PostInfoController extends GetxController{
  File? image;
  String title = "";
  String description = "";
  DateTime date = DateTime.now();
}