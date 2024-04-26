import 'package:flutter/material.dart';

class PageMixSizeFadeTrasition extends PageRouteBuilder{
  final Widget page;
  PageMixSizeFadeTrasition(this.page): super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child)=>Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: animation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    )
  );
}