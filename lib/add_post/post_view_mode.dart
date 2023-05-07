
import 'dart:io';
import 'package:flutter/material.dart';

class Post_Model extends ChangeNotifier{
  File? imageFile = null;
  TextEditingController descriptionController=TextEditingController();
  TextEditingController title=TextEditingController();
  String get_title(){return title.text;}
  String get_des(){return descriptionController.text;}

}