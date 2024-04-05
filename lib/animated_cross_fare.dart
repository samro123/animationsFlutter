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
            duration: const Duration(seconds: 1),
            firstChild: Image.network("https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            secondChild: Image.network("https://images.pexels.com/photos/459203/pexels-photo-459203.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            crossFadeState: _isFirstWidgetVisible
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
