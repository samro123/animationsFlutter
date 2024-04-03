import 'package:flutter/material.dart';
class AnimatedTextSizeExample extends StatefulWidget {
  const AnimatedTextSizeExample({Key? key}) : super(key: key);

  @override
  State<AnimatedTextSizeExample> createState() => _AnimatedTextSizeExampleState();
}

class _AnimatedTextSizeExampleState extends State<AnimatedTextSizeExample> {
  double _fontSize = 30.0;
  Color _color = Colors.grey;

  _doAnimation(){
    setState(() {
      _fontSize = 50.0;
      _color = Colors.deepOrange;
    });
  }

  _resetAnimation(){
    setState(() {
      _fontSize = 30.0;
      _color = Colors.grey;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated TextStyle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
              child: const Text("Hello"),
              style: TextStyle(fontSize: _fontSize, color: _color),
              duration: Duration(milliseconds: 400),
              curve: Curves.bounceIn,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: _doAnimation, icon: Icon(Icons.add)),
              IconButton(onPressed: _resetAnimation, icon: Icon(Icons.remove)),
            ],
          )
        ],
      ),
    );
  }
}
