import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(blurRadius: 40.0),
                ],
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 100),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Text",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
