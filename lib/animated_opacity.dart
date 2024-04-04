import 'package:flutter/material.dart';
class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool _isVisible =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aminated Opactity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Text(
                "Tom and Jerry",
                style: TextStyle(fontSize: 40),
              ),
            ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              child: Container(
                color: Colors.transparent,
                width: 100,
                height: 100,
                child: Image.asset("assets/tom.png"),
              ),
            ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 1500),
                curve: Curves.easeInCirc,
                child: Container(
                  color: Colors.transparent,
                  width: 100,
                  height: 100,
                  child: Image.asset("assets/jerry.png"),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: (){
          setState(() {
            _isVisible = !_isVisible;
          });
        },
      ),
    );
  }
}
