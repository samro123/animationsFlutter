import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({Key? key}) : super(key: key);

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );
    _animation =CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn
    );
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icon"),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animationController,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.cyan,
          )
        ),
      ),
    );
  }
}
