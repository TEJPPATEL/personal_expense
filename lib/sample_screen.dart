import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this, value: 1, lowerBound: 0.9,upperBound: 1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    
      _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    
    _controller.forward();


    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          transform: Matrix4.rotationZ(-20 * pi / 180)..translate(-10.0),
          // alignment: Alignment.center,
          // height: double.infinity,
          // width: double.infinity,
          // transform: Matrix4.rotationZ(-8 * pi / 180 )..translate(-10),
          color: Colors.lightGreenAccent,
          child: ScaleTransition(
            scale: _animation,
            // scale: Animation,
            child: Text("My Shop",
                style: TextStyle(color: Colors.red, fontSize: 50)),
          ),
        ),
      ),
    );
  }
}
