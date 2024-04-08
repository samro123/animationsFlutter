import 'package:flutter/material.dart';

class AnimationFadeTransition extends StatefulWidget {
  const AnimationFadeTransition({Key? key}) : super(key: key);

  @override
  State<AnimationFadeTransition> createState() =>
      _AnimationFadeTransitionState();
}

class _AnimationFadeTransitionState extends State<AnimationFadeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _startAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Fade Transition"),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animationController,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Fade me now !!",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
