import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
int selectedIndex=3; //the index of selected page to display the tags for each page
//if the index is 4 it means we are adding a post to esi info page and this post will be added by admin without tags
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(child: Text("logout"),
        onPressed: ()=>ApiServices.logoutUser(context),),
      ),
    
    );
  }
}