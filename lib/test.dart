import 'package:flutter/material.dart';

class Test extends StatefulWidget {
   const Test({super.key});
  

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           
          },
          child: const Text("show dialog"),
        ),
      ),
    );
  }
}
