import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat(reverse: true);
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
        title: Text("Animated Builder"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _animationController.value * 2 * pi,
              child: Container(
                width: 250,
                height: 250,
                color: Colors.transparent,
                child: Image.asset("assets/dog.png"),
              ),
            );
          },
        ),
      ),
    );
  }
}
