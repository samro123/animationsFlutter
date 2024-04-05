import 'package:flutter/material.dart';

class AnimatedCrossFareExample extends StatefulWidget {
  const AnimatedCrossFareExample({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFareExample> createState() =>
      _AnimatedCrossFareExampleState();
}

class _AnimatedCrossFareExampleState extends State<AnimatedCrossFareExample> {
  bool _isFirstWidgetVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Cross Fare"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isFirstWidgetVisible = !_isFirstWidgetVisible;
            });
          },
          child: AnimatedCrossFade(
            firstCurve: Curves.linear,
            secondCurve: Curves.linear,
            duration: const Duration(milliseconds: 400),
            firstChild: Container(
              height: 200,
              width: 200,
              color: Colors.blueAccent,
              child: Image.asset("assets/jerry.png"),
            ),
            secondChild: Container(
              height: 200,
              width: 200,
              color: Colors.blueAccent,
              child: Image.asset("assets/dog.png"),
            ),
            crossFadeState: _isFirstWidgetVisible
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
