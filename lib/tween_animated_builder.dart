import 'package:flutter/material.dart';

class TweenAnimatedBuilderExample extends StatefulWidget {
  const TweenAnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  State<TweenAnimatedBuilderExample> createState() =>
      _TweenAnimatedBuilderExampleState();
}

class _TweenAnimatedBuilderExampleState
    extends State<TweenAnimatedBuilderExample> {
  double _opacityLevel = 0.0;
  Color _colors = Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animated Builder"),
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: _opacityLevel),
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context,double value,Widget? child) {
                    return Opacity(
                        opacity: value,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(_opacityLevel * value * 76)
                          ),
                        ),
                    );
                  },),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(
                  begin: Colors.white, end: _colors),
                duration: const Duration(seconds: 3),
                curve: Curves.bounceInOut,
                builder: (BuildContext context,Color? value,Widget? child) {
                  return ColorFiltered(
                      colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                    child: Image.asset("assets/tom.png"),
                  );
                },
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
                  _colors = _colors == Colors.deepOrange ? Colors.white : Colors.deepOrange;
                });
              }, child: Text("Animate!!"))
            ],
          ),
        ),
      ),
    );
  }
}
