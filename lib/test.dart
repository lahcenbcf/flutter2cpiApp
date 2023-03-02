import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
             showDialog(
          //    barrierColor: Colors.black.withOpacity(0.5),
              context: context,
              builder: (context) {return AlertDialog(
                content: Container(color: Colors.green,height: 300,),
               
                surfaceTintColor: Colors.red,
              );},
            );
          },
          child: const Text("show dialog"),
        ),
      ),
    );
  }
}
