import 'package:flutter/material.dart';

class AnimatedPositionedDirectionExample extends StatefulWidget {
  const AnimatedPositionedDirectionExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedDirectionExample> createState() =>
      _AnimatedPositionedDirectionExampleState();
}

class _AnimatedPositionedDirectionExampleState
    extends State<AnimatedPositionedDirectionExample> {
  double _start = 0;
  double _top = 0;
  void _moveLeft() {
    setState(() {
      _start -= 50;
      if (_start < 0) {
        _start = 0;
      }
    });
  }

  void _moveRight() {
    setState(() {
      _start += 50;
      if (_start > MediaQuery.of(context).size.width - 120) {
        _start = MediaQuery.of(context).size.width - 120;
      }
    });
  }

  void _moveUp() {
    setState(() {
      _top -= 50;
      if (_top < 0) {
        _top = 0;
      }
    });
  }

  void _moveDown() {
    setState(() {
      _top += 50;
      if (_top > MediaQuery.of(context).size.width - 120) {
        _top = MediaQuery.of(context).size.width - 120;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned Direction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              start: _start,
              top: _top,
              duration: Duration(milliseconds: 400),
              child: Container(
                height: 120,
                width: 120,
                color: Colors.transparent,
                child: Image.asset("assets/dog.png"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: _moveLeft,
                      child: Icon(Icons.arrow_circle_left_outlined)),
                  ElevatedButton(
                      onPressed: _moveRight,
                      child: Icon(Icons.arrow_circle_right_outlined)),
                  ElevatedButton(
                      onPressed: _moveUp,
                      child: Icon(Icons.arrow_circle_up_outlined)),
                  ElevatedButton(
                      onPressed: _moveDown,
                      child: Icon(Icons.arrow_circle_down_outlined))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
