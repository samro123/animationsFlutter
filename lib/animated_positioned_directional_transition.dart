import 'package:flutter/material.dart';

class AnimatedPositionedDirectionalTransition extends StatefulWidget {
  const AnimatedPositionedDirectionalTransition({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedDirectionalTransition> createState() =>
      _AnimatedPositionedDirectionalTransitionState();
}

class _AnimatedPositionedDirectionalTransitionState
    extends State<AnimatedPositionedDirectionalTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = RelativeRectTween(
            begin: const RelativeRect.fromLTRB(0, 0, 100, 100),
            end: const RelativeRect.fromLTRB(100, 100, 0, 0))
        .animate(_animationController);
  }

  _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  _reverseAnimation() {
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
        title: const Text("Animated Positioned Directional Transition"),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return PositionedDirectional(
                  bottom: _animation.value.bottom,
                  top: _animation.value.top,
                  start: _animation.value.left,
                  end: _animation.value.right,
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.redAccent,
                    child: Image.asset("assets/dog.png"),
                  ));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _startAnimation, child: const Icon(Icons.start)),
                ElevatedButton(
                    onPressed: _reverseAnimation,
                    child: const Icon(Icons.close))
              ],
            ),
          )
        ],
      ),
    );
  }
}
