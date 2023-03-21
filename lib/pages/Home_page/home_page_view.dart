import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
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