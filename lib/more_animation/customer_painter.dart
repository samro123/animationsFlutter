import 'package:flutter/material.dart';

class CustomerPainterExample extends StatefulWidget {
  const CustomerPainterExample({Key? key}) : super(key: key);

  @override
  State<CustomerPainterExample> createState() => _CustomerPainterExampleState();
}

class _CustomerPainterExampleState extends State<CustomerPainterExample>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1)
    );

    _sizeAnimation = Tween<double>(begin: 50, end: 150).animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.red, end:Colors.blue).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Painter Example"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {

            return CustomPaint(
              painter: CirclePaint(
                _sizeAnimation.value,
                _colorAnimation.value ?? Colors.red
              ),
              size: const Size.square(200),
            );
          },
        ),
      ),
    );
  }
}

class CirclePaint extends CustomPainter{
  final Color _color;
  final double _size;
  CirclePaint(this._size, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;
    
    canvas.drawCircle(Offset(size.width /2, size.height / 2), _size, paint);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
      return (_size != oldDelegate._size || _color != oldDelegate._color);
  }


}
