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
        child: AnimatedSwitcher(
          switchInCurve: Curves.bounceInOut,
          switchOutCurve: Curves.decelerate,
          duration: Duration(seconds: 1),
          child: _isFirstWidgetVisible
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFirstWidgetVisible = !_isFirstWidgetVisible;
                    });
                  },
                  child: Text("Login Now!"))
              : const CircularProgressIndicator(),
        ),
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
}
