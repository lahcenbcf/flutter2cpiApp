import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Sign_up/sign_up_view.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';
import 'services/sharedServices.dart';

class wrapper extends StatelessWidget {
  final bool isLogged;
   wrapper({required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return isLogged?HomePage():SignUp();
  }
}