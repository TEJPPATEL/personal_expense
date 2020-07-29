import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/transcation.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transcationList;
  TranscationList({this.transcationList});
  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisAlignment:,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: transcationList.map(
        (transcation) {
          return Card(
            elevation: 5.0,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$:${transcation.amount.toStringAsFixed(2)}",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(25),

                      // color: Colors.red,
                      // width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${transcation.title}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(DateFormat.yMMMd().format(transcation.date))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
