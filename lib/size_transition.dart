import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({Key? key}) : super(key: key);

  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationControllerl;
  late Animation<double> _animation;
  @override
  void initState() {
    _animationControllerl = AnimationController(
        vsync: this,
         duration: Duration(seconds: 1)
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationControllerl, curve: Curves.bounceInOut)
    );
    super.initState();
  }
  _startAnimation(){
    _animationControllerl.reset();
    _animationControllerl.forward();
  }


  @override
  void dispose() {
    _animationControllerl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Transitions"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _startAnimation,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: SizeTransition(
                sizeFactor: _animation,
                child: Container(
                  width: 200,
                  height: 200,
                  color:Colors.red,
                  child: Image.asset('assets/tom.png'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
