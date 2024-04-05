import 'package:flutter/material.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool _isFirstWidgetVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Switcher"),
      ),
      body: Center(
        child: _ChildAnimatedSwitcher(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.switch_account),
        onPressed: (){
          setState(() {
            _isFirstWidgetVisible = !_isFirstWidgetVisible;
          });
        },
      ),
    );
  }

  Widget _ChildAnimatedSwitcher(){
    return AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
              scale: animation,
              child: child,
          );
        },
      child:_isFirstWidgetVisible ? Icon(
        Icons.favorite,
        color: Colors.red,
        size: 200,
        key: UniqueKey(),
      ): Icon(
        Icons.favorite_border,
        color: Colors.grey,
        size: 200,
        key: UniqueKey(),
      ),
    );
  }
}
