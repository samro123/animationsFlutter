import 'package:flutter/material.dart';
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Two Page"),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Back go"),
        ),
      ),
    );
  }
}
