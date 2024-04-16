import 'package:animations/page_transitions/enter_exit_route.dart';
import 'package:animations/page_transitions/page_fade_transition.dart';
import 'package:animations/page_transitions/rotation_route.dart';
import 'package:animations/page_transitions/size_route.dart';
import 'package:animations/page_transitions/slide_right_route.dart';
import 'package:flutter/material.dart';

import 'page_transitions/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageFadeTransition(const PageTwo()));
                }, child: Text("Animated Aligin Example")),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(SlideRightRoute(const PageTwo()));
                }, child: Text("Animated Aligin Example 2 ")),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(RotationRoute(const PageTwo()));
                }, child: Text("Animated Aligin Example 3 ")),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(SizeRoute(const PageTwo()));
                }, child: Text("Animated Aligin Example 4")),

            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(EnterExitRoute(this.widget, PageTwo()));
                }, child: Text("Animated Aligin Example 5")),
          ],
        ),
      ),
    );
  }
}
