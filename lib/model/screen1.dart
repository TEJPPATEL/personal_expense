import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child:Text("Next Page"),
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
      ),
    );
  }
}
