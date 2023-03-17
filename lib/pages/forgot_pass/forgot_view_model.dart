import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forgot_view.dart';

class View_model extends ChangeNotifier{

  TextEditingController email_controler1=TextEditingController();

  bool checkSpaces(String input) {
    int i = 0;
    while (i < input.length && input[i] != " ") {
      i++;
    }
    return i == input.length;
  }
  validate(String? input) {  if(input!.isEmpty || input.length<11){
    return "Enter correct email";}else if(input.substring(input.length-11)!="@esi-sba.dz"){
    return "Enter your esi sba email";

  }
  else if(!checkSpaces(input)){
    return "check the space";
  }
  return null;
  }
}