import 'package:flutter/material.dart';

class AnimatedContanerExample extends StatefulWidget {
  const AnimatedContanerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedContanerExample> createState() =>
      _AnimatedContanerExampleState();
}

class _AnimatedContanerExampleState extends State<AnimatedContanerExample> {
  Color _color = Colors.grey;
  double _radius = 20.0;
  double _width = 100.0;
  double _height = 100.0;

  void _setAnimationValue() {
    setState(() {
      _color = Colors.blue;
      _radius = 90.0;
      _width = 400.0;
      _height = 400.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _setAnimationValue();
          },
          child: AnimatedContainer(
            width: _width,
            height: _height,
            duration: Duration(milliseconds: 400),
            decoration: BoxDecoration(
                color: _color, borderRadius: BorderRadius.circular(_radius)),
            child: Image.asset("assets/jerry.png"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: (){
          setState(() {
            _color = Colors.grey;
            _height = 100.0;
            _width = 100.0;
            _radius = 20.0;
          });
        },
      ),
    );
  }
}
