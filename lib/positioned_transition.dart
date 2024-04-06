import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({Key? key}) : super(key: key);

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _jerryAnimation;
  late Animation<RelativeRect> _tomAnimation;
  late Animation<RelativeRect> _spikeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _jerryAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(300, 300, 0, 0))
        .animate(_animationController);

    _tomAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(150, 150, 0, 0))
        .animate(_animationController);

    _spikeAnimation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
            end: const RelativeRect.fromLTRB(50, 50, 0, 0))
        .animate(_animationController);
  }

  void _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  void _reverseAnimation() {
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Positioned Transition"),
      ),
      body: Stack(
        children: [
          PositionedTransition(
              rect: _spikeAnimation,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blueAccent,
                child: Image.asset("assets/dog.png"),
              )),
          PositionedTransition(
              rect: _tomAnimation,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Image.asset("assets/tom.png"),
              )),
          PositionedTransition(
              rect: _jerryAnimation,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                child: Image.asset("assets/jerry.png"),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _startAnimation, child: Icon(Icons.start)),
                ElevatedButton(
                    onPressed: _reverseAnimation, child: Icon(Icons.close)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
