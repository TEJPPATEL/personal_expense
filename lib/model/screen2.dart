import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Go Back"),
        onPressed: () => {
          Navigator.pop(context)
        },
      ),
    );
  }
}