import 'package:flutter/material.dart';

class ScaleTransitionRoute extends PageRouteBuilder{
  final Widget page;
  ScaleTransitionRoute(this.page):super(
    pageBuilder: (context, animation, secondaryAnimation)=>page,
    transitionsBuilder: (context , animation, secondarayAnimation, child)=> ScaleTransition(
      scale: animation = CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn),
      child: child,
    )
  );
}