import 'package:flutter/material.dart';

class IndexedStackTransitionExample extends StatefulWidget {
  const IndexedStackTransitionExample({Key? key}) : super(key: key);

  @override
  State<IndexedStackTransitionExample> createState() =>
      _IndexedStackTransitionExampleState();
}

class _IndexedStackTransitionExampleState
    extends State<IndexedStackTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
   _scaleAnimation = Tween<double>(
     begin: 0.5,
     end: 1.0,
   ).animate(_animationController);

   _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeScreen(){
    _currentIndex = _currentIndex + 1;
    if(_currentIndex == 3){
      _currentIndex == 0;
    }
    setState(() {
      _animationController.reset();
      _animationController.forward();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text("Indexed Stack Transition"),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Image.asset("assets/dog.png"),
                  ),
                ),
            ),
            ScaleTransition(
                scale: _scaleAnimation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: Image.asset("assets/tom.png"),
              ),
            ),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                alignment: Alignment.center,
                color: Colors.yellow,
                child: Image.asset("assets/jerry.png"),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeScreen,
          child: Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
