import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({Key? key}) : super(key: key);

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1)
    );
    _animationController.repeat(reverse: false);
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
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _animationController,
        ),
      ),
    );
  }
}
