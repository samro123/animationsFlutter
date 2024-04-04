import 'package:flutter/material.dart';

class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionExample> createState() =>
      _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
  bool _startEating = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AnimatedPositioned(
                top: 0,
                left: 0,
                child: Container(
                  color: Colors.transparent,
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/cheese.png"),
                ),
                duration: Duration(milliseconds: 400)),
            AnimatedPositioned(
                top: 0,
                left: _startEating ? MediaQuery.of(context).size.width - 150 : 0,
                curve: Curves.bounceInOut,
                child: Container(
                  color: Colors.transparent,
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/dog.png"),
                ),
                duration: Duration(milliseconds: 400)),
            AnimatedPositioned(
                top: _startEating ? MediaQuery.of(context).size.width / 2 : 0,
                left: _startEating ? MediaQuery.of(context).size.width / 2 : 0,
                child: Container(
                  color: Colors.transparent,
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/jerry.png"),
                ),
                duration: Duration(milliseconds: 400)),
            AnimatedPositioned(
                top: _startEating ? MediaQuery.of(context).size.width - 300 : 0,
                left: 0,
                child: Container(
                  color: Colors.transparent,
                  width: 120,
                  height: 120,
                  child: Image.asset("assets/tom.png"),
                ),
                duration: Duration(milliseconds: 400)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _startEating = !_startEating;
          });
        },
        child: _startEating ? Icon(Icons.place): Icon(Icons.back_hand),
      ),
    );
  }
}
