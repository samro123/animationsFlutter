import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  List<String> characters = ["tom", "jerry", "dog", "cheese"];
  double _paddingValue = 10.0;
  bool _isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      body: Center(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(4, (index){
              return AnimatedPadding(
                  padding: EdgeInsets.all(_paddingValue),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/${characters[index]}.png"),
                  ),
              );
            }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isExpand ? Icons.expand : Icons.expand_less),
        onPressed: (){
          setState(() {
            _isExpand = ! _isExpand;
            _paddingValue = _isExpand ? 30.0 : 10.0;
          });
        },
      ),
    );
  }
}
