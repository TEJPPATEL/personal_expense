import 'dart:io';

import 'package:Expense/transcation_list.dart';
import 'package:Expense/user_transcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_transcation.dart';
import 'chart.dart';
import 'model/transcation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showChart = false;

  final List<Transcation> transcations = [
    Transcation(id: "1", title: "Food", amount: 500, date: DateTime.now()),
    Transcation(id: "2", title: "Fruit", amount: 1000, date: DateTime.now()),
  ];

  _addNewTranscation(String title, double amount) {
    Transcation newTranscation = Transcation(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transcations.add(newTranscation);
    });
  }

  void openTranscationModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return GestureDetector(
              child: AddTranscation(_addNewTranscation),
              onTap: () {},
              behavior: HitTestBehavior.opaque);
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final AppBar appBar =  AppBar(
            elevation: 0,
            title: Text("Personal Expense"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  openTranscationModal(context);
                },
              ),
            ],
          );
      
    final CupertinoNavigationBar cupertinoappBar = CupertinoNavigationBar(
            middle: Text("Personal Expense"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () {
                    openTranscationModal(context);
                  },
                ),
              ],
            ),
          );



    final pageBody = SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  // Card(
                  //   color: Colors.white,
                  //   child: Container(
                  //     width: double.infinity,
                  //     child: Text(
                  //       "Chart",
                  //       style: TextStyle(color: Colors.purple),
                  //     ),
                  //   ),
                  // ),
                  if (isLandscape)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Show Chart"),
                        Platform.isIOS
                            ? Switch.adaptive(
                                onChanged: (bool value) {
                                  setState(() {
                                    _showChart = value;
                                  });
                                },
                                //for ios Switch.adaptive( property same is there only color is set by using Thme.of(context).accentColor)
                                value: _showChart,
                              )
                            : Switch(
                                onChanged: (bool value) {
                                  setState(() {
                                    _showChart = value;
                                  });
                                },
                                //for ios Switch.adaptive( property same is there only color is set by using Thme.of(context).accentColor)

                                value: _showChart,
                              ),
                      ],
                    ),

                  if (!isLandscape)
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.2,
                      child: Chart(recentTranscation: transcations),
                    ),
                  if (!isLandscape)
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.8,
                      child: TranscationList(
                        transcationList: transcations,
                      ),
                    ),

                  if (_showChart)
                    Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.8,
                      child: Chart(recentTranscation: transcations),
                    ),
                  // Container(
                  //   height: (MediaQuery.of(context).size.height -
                  //           appBar.preferredSize.height -
                  //           MediaQuery.of(context).padding.top) *
                  //       0.8,
                  //   child: TranscationList(
                  //     transcationList: transcations,
                  //   ),
                  // )
                ],
              ),
            );
    return Platform.isIOS
        ? CupertinoPageScaffold(
          navigationBar: cupertinoappBar,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,

            // decoration: BoxDecoration(
            //     // gradient: LinearGradient(
            //     //   colors: [Colors.white, Colors.purple],
            //     //   begin: Alignment.bottomRight,
            //     //   end:Alignment.center
            //     // ),
            //     ),
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      openTranscationModal(context);
                    },
                  ),
          );
  }
}
