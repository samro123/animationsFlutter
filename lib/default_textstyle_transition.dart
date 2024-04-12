import 'package:flutter/material.dart';

class DefaultTextStyleTransitionExample extends StatefulWidget {
  const DefaultTextStyleTransitionExample({Key? key}) : super(key: key);

  @override
  State<DefaultTextStyleTransitionExample> createState() =>
      _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState
    extends State<DefaultTextStyleTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  TextStyle _textStyle1 =
      TextStyle(fontSize: 26, color: Colors.red, fontWeight: FontWeight.bold);
  TextStyle _textStyle2 = TextStyle(
      fontSize: 26, color: Colors.black54, fontWeight: FontWeight.normal);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Default TextStyle Transition"),
      ),
      body: DefaultTextStyleTransition(
        style: _animation.drive(TextStyleTween(begin: _textStyle1, end: _textStyle2)),
        child: Text("Hello Flutter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_animationController.status == AnimationStatus.completed){
            _animationController.reverse();
          }else{
            _animationController.forward();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
